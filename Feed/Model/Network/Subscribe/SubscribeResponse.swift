
import Foundation

struct SubscribeResponse: Codable {
    var id: Int?
    var title: String?
    var url: String?
    var errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title, url
        case errorMessage = "error"
    }
}
