
import Foundation

class LoginHeader: Encodable {
    let contentType: String = "application/json"
    
    enum CodingKeys: String, CodingKey {
        case contentType = "Content-Type"
    }
}
