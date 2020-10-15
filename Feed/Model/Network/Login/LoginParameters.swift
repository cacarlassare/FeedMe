
import Foundation

class LoginParameters: Encodable {
    var user: String
    var password: String
    
    init(user: String, password: String) {
        self.user = user
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case user, password
    }
}
