# Xcode 13 & 14 indexing regression for Swift static libraries

### Summary:
Syntax highlighting doesn't work for symbols from pre-compiled Swift static libraries (with or without .xcframework), it's 100% reproducible.

It's a regression from Xcode 13 & 14 because everything works as expected in Xcode 12.5.

### Steps to Reproduce:
1. Pre-compile a Swift static library in a project
2. Create a new project, copy the pre-compiled library into the root of the new project
3. Add the library path to `SWIFT_INCLUDE_PATHS` and `LIBRARY_SEARCH_PATHS`
4. Reference a symbol from the library
5. Build (this should be successful)
6. Check syntax highlighting

### Expected Results:
Syntax highlighting for symbols from the pre-compiled library to work.

### Actual Results:
Syntax highlighting doesn't work.

### Versions:
- Xcode 13.3
- Xcode 14.1

Tested with macOS Monterey 12.2 and Intel MacBook Pro.

### Sample projects:

There are 3 sample projects in this repository:
- One sample to build the Swift static library (named StaticAnimals);
- One sample iOS app integrating the static library as .xcframework;
- One sample iOS app integrating the static library `.a` directly, without .xcframework.

#### How to run

- Run `make setup` to build de Swift static library (StaticAnimals) for iOS Simulator.

- Open `XCFrameworkRegressionProject/XCFrameworkRegression.xcodeproj` with Xcode 13 or Xcode 14
- Go to `Here.swift`
- Build for simulator (should be successful)
- Check syntax highlighting

- Open `SwiftStaticRegressionProject/SwiftStaticRegression.xcodeproj` with Xcode 13 or Xcode 14
- Go to `Here.swift`
- Build for simulator (should be successful)
- Check syntax highlighting

Both projects can also be tested with Xcode 12.5 for comparison.
