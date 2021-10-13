# xcode13-indexing-problem

### Summary:
Currently if you have a project that links a pre-compiled Swift module (a static framework in the attached example project), when you try and jump to definition, Xcode fails and shows the question mark pop-up. Syntax highlighting also doesn't work for symbols from the pre-compiled module.

### Steps to Reproduce:
1. Pre-compile a Swift static framework in a project
2. Create a new project, copy the pre-compiled framework into the root of the new project
3. Import the pre-compiled framework in your project, and reference a symbol
4. Build (this should be successful)
5. Jump to definition on either the symbol or the import

### Expected Results:
You see the generated interface of the Swift module

### Actual Results:
Xcode shows the question mark modal and syntax highlighting doesn't work

### Version:
Xcode 13.0 (13A233)

### Sample project:
- The project builds correctly, the indexing and auto-complete works.
- Alamofire symbols have no syntax highlighting and jump to definition doesn't work.
- Checkout branch `xcode12` and run with Xcode 12.5 to see everything working as expected.
