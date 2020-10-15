
import Foundation

class RegisterHeader: Encodable {
    let contentType: String = "application/json"
    
    enum CodingKeys: String, CodingKey {
        case contentType = "Content-Type"
    }
}
