// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public extension String{
    func getString(_ args:CVarArg...)->String{
        return LocalKStringFormatter.getString(key: self, args)
    }
}

public final class LocalKStringFormatter{
    public static func getString(key: String, _ args: CVarArg...)->String{
        let format = NSLocalizedString(key, comment: "")
        return String.init(format: format, arguments: args)
    }
}
