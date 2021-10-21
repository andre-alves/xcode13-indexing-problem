import Foundation

public struct Dog {
    public let name: String

    public init(name: String) {
        self.name = name
    }

    /// Example comment
    public func bark() {
        print("\(name) bark")
    }
}
