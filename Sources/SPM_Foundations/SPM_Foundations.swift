// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import Factory


final public class Foundations: SharedContainer {
    public let manager = ContainerManager()
    
    public static let shared = Foundations()
}

extension Foundations {
    
    var storageManager: Factory<StorageManager> {
        self { StorageManagerImplementation.shared }
            .singleton
    }
    
    var colorHelper: Factory<ColorHelper> {
        self { ColorHelperImplementation.shared }
            .singleton
    }
}
