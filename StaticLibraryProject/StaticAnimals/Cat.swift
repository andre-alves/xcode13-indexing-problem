import Foundation

public struct Cat {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    /// Example comment
    public func meow() {
        print("\(name) meow")
    }
}
