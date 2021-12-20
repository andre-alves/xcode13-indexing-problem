BUILD_DIR = build
DERIVED_DATA = $(BUILD_DIR)/derived_data
SIMULATOR_BUILD = $(BUILD_DIR)/simulators

clean:
	rm -rf $(BUILD_DIR)

setup: build_static_library
	# Copy .xcframework as-is to XCFrameworkRegressionProject
	rm -rf XCFrameworkRegressionProject/Libs
	mkdir -p XCFrameworkRegressionProject/Libs
	cp -R $(BUILD_DIR)/StaticAnimals.xcframework XCFrameworkRegressionProject/Libs/StaticAnimals.xcframework

	# Copy .a and .swiftmodule to SwiftStaticRegressionProject
	rm -rf SwiftStaticRegressionProject/Libs
	mkdir -p SwiftStaticRegressionProject/Libs
	cp -R $(SIMULATOR_BUILD) SwiftStaticRegressionProject/Libs/StaticAnimals-sim
	# Remove .swiftinterface and .swiftsourceinfo because they are optional
	find SwiftStaticRegressionProject/Libs/StaticAnimals-sim/ -name '*.swiftinterface' -delete
	find SwiftStaticRegressionProject/Libs/StaticAnimals-sim/ -type d -name Project -a -prune -exec rm -rf {} \;

	@echo ""
	@echo "--------------- Finish setup! ---------------"
	@echo "Please, open 'XCFrameworkRegressionProject/XCFrameworkRegression.xcodeproj' with Xcode 13"
	@echo "- It's an iOS app binary linked with StaticAnimals.xcframework (Swift static library)"
	@echo "- Go to 'Here.swift'"
	@echo "- Build for simulator (should be succesful)"
	@echo "- Check Syntax highlighting"
	@echo ""
	@echo "Please, also check 'SwiftStaticRegressionProject/SwiftStaticRegression.xcodeproj' with Xcode 13"
	@echo "- Very similar to the other project, and has the same issues, but using the static library directly (no .xcframework)"
	@echo ""

build_static_library: clean
	mkdir -p $(SIMULATOR_BUILD)

	xcodebuild build \
	-project StaticLibraryProject/StaticAnimals.xcodeproj \
	-scheme StaticAnimals \
	-derivedDataPath $(DERIVED_DATA) \
	-sdk iphonesimulator

	cp -r ${DERIVED_DATA}/Build/Products/Debug-iphonesimulator/ $(SIMULATOR_BUILD)

	xcodebuild -create-xcframework \
    -library $(SIMULATOR_BUILD)/libStaticAnimals.a \
    -output $(BUILD_DIR)/StaticAnimals.xcframework
