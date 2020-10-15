
import Foundation

struct NetworkError: LocalizedError {
    
    var errorDescription: String? { return self.customDescription }
    var failureReason: String? { return self.customDescription }
    fileprivate var customDescription : String

    init(_ description: String) {
        self.customDescription = description
    }
}
