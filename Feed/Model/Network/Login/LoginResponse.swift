
import Foundation

struct LoginResponse: Codable {
    var accesToken: String?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case accesToken = "access_token"
        case message
    }
}
