
import Foundation

class SubscribeParameters: Encodable {
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case url
    }
}
