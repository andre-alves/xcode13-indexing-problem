# Xcode 13 indexing regression for Swift static libraries

### Summary:
Currently if you have a project that links a pre-compiled Swift static library (with or without .xcframework), when you try and jump to definition, Xcode fails and shows the question mark pop-up. Syntax highlighting also doesn't work for symbols from the pre-compiled library.

It's a regression from Xcode 13 because everything works as expected in Xcode 12.5. 

### Steps to Reproduce:
1. Pre-compile a Swift static library in a project
2. Create a new project, copy the pre-compiled library into the root of the new project
3. Add the library path to `SWIFT_INCLUDE_PATHS` and `LIBRARY_SEARCH_PATHS`
4. Reference a symbol from the library
5. Build (this should be successful)
6. Jump to definition on either the import declaration or the symbol. Also check syntax highlighting

### Expected Results:
You see the generated interface of the Swift module and syntax highlighting

### Actual Results:
Xcode shows the question mark modal and syntax highlighting doesn't work

### Version:
Xcode 13.0 (13A233)
Xcode 13.1 RC (13A1030d)

Tested with macOS Big Sur 11.6 and Intel MacBook Pro.

### Sample projects:

There are 3 sample projects in this repository:
- One to build the Swift static library (named StaticAnimals);
- One iOS app integrating the static library as .xcframework;
- One iOS app integrating the static library `.a` directly, without .xcframework.

- Run `make setup` to build de Swift static library (StaticAnimals) for iOS Simulator.

- Open `XCFrameworkRegressionProject/XCFrameworkRegression.xcodeproj` with Xcode 13
- Go to `Here.swift`
- Build for simulator (should be succesful)
- Check syntax highlighting and jump to definition

- Open `SwiftStaticRegressionProject/SwiftStaticRegression.xcodeproj` with Xcode 13
- Go to `Here.swift`
- Build for simulator (should be succesful)
- Check syntax highlighting and jump to definition
- _Note: for this project, only .swiftmodule and .swiftdoc was provided, because AFAIK .swiftinterface and .swiftsourceinfo are optional_

Both projects can also be tested with Xcode 12.5 for comparison.
