
import Foundation

class SubscribeHeader: Encodable {
    let contentType: String = "application/json"
    let authorization: String
    
    init(accessToken: String) {
        self.authorization = "Bearer \(accessToken)"
    }
 
    enum CodingKeys: String, CodingKey {
        case contentType = "Content-Type"
        case authorization = "Authorization"
    }
}
