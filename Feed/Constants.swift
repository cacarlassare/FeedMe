
import Foundation

public struct Constants {
    
    // MARK: - URLs
    
    public struct URL {
        static let BASE = "http://167.99.162.146"

        static let REGISTER = "\(Constants.URL.BASE)/users/register"
        static let LOGIN = "\(Constants.URL.BASE)/users/login"
        static let SUBSCRIBE = "\(Constants.URL.BASE)/feeds/add"
    }
}
