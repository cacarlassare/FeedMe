
import Foundation

class Feed {
    var id: Int
    var url: String
    var title: String
    
    init(id: Int, url: String, title: String) {
        self.id = id
        self.url = url
        self.title = title
    }
    
    
    static func from(subscribeResponse: SubscribeResponse) -> Feed? {
        guard let id = subscribeResponse.id, let url = subscribeResponse.url, let title = subscribeResponse.title else {
            return nil
        }
        
        return Feed(id: id, url: url, title: title)
    }
}
