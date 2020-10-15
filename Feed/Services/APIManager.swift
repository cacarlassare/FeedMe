
import Foundation

class APIManager {
    
    fileprivate static var user: User?
    
    
    static func register(user: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        
        let registerParameters = RegisterParameters(user: user, password: password)
        
        APIService.register(parameters: registerParameters) { (response) in
            if let accessToken = response.accesToken {
                self.user = User(accessToken: accessToken)
                onSuccess()
                return
            }
            
            if let errorMessage = response.message {
                let error = NetworkError(errorMessage)
                onError(error)
                return
            }
            
            onError(nil)
        } onError: { (error) in
            onError(error)
        }
    }
    
    static func login(user: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        
        let loginParameters = LoginParameters(user: user, password: password)
        
        APIService.login(parameters: loginParameters) { (response) in
            if let accessToken = response.accesToken {
                self.user = User(accessToken: accessToken)
                onSuccess()
                return
            }
            
            if let errorMessage = response.message {
                let error = NetworkError(errorMessage)
                onError(error)
                return
            }
            
            onError(nil)
        } onError: { (error) in
            onError(error)
        }
    }
    
    static func subscribe(feedURL: String, onSuccess: @escaping (Feed) -> Void, onError: @escaping (Error?) -> Void) {
        
        guard let accessToken = self.user?.accessToken else {
            let error = NetworkError("You must login, amigo")
            onError(error)
            return
        }
        
        let subscribeParameters = SubscribeParameters(url: feedURL)
        
        APIService.subscribe(parameters: subscribeParameters, accessToken: accessToken) { (response) in
            
            if let errorMessage = response.errorMessage {
                let error = NetworkError(errorMessage)
                onError(error)
                return
            }
            
            if let feed = Feed.from(subscribeResponse: response) {
                onSuccess(feed)
                return
            }
            
            onError(nil)
        } onError: { (error) in
            onError(error)
        }
    }
}
