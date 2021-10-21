import Foundation
import StaticAnimals // Jump to definition failing (expectation: open the module interface)

final class Here {

    func execute() {
        /*
         Symbols from StaticAnimals (Swift static .xcframework):
         - Syntax highlighting is not working
         - Auto completion is working
         - Jump to definition is working but only because .swiftsourceinfo was provided,
            otherwise jump to definition also fails (expectation: open the module interface)
         */
        let cat = Cat(name: "Kit")
        cat.meow()

        print("finish")
    }
}
