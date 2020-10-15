
import Foundation

struct RegisterResponse: Codable {
    var accesToken: String?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case accesToken = "access_token"
        case message
    }
}
