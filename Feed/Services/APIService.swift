
import Foundation

class APIService {
    
    // MARK: - Register
    
    static func register(parameters: RegisterParameters, onSuccess: @escaping (RegisterResponse) -> Void, onError: @escaping (Error) -> Void) {
    
        let url = URL(string: "\(Constants.URL.REGISTER)")!
        let resource = NetworkPOSTResource(url: url)
        let registerHeader = RegisterHeader().dictionary
        let encodedParameters = parameters.dictionary
        
        NetworkService.loadPost(resource, header: registerHeader, parameters: encodedParameters) { (result) in
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dataDecodingStrategy = .base64
                
                if let registerResponse = try? decoder.decode(RegisterResponse.self, from: data) {
                    onSuccess(registerResponse)
                    return
                }

                onError(APIClientError.cantParseData)

            case .failure(let error):
                onError(error)
            }
        }
    }
    
    
    // MARK: - Login
    
    static func login(parameters: LoginParameters, onSuccess: @escaping (LoginResponse) -> Void, onError: @escaping (Error) -> Void) {
    
        let url = URL(string: "\(Constants.URL.LOGIN)")!
        let resource = NetworkPOSTResource(url: url)
        let loginHeader = LoginHeader().dictionary
        let encodedParameters = parameters.dictionary

        NetworkService.loadPost(resource, header: loginHeader, parameters: encodedParameters) { (result) in
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dataDecodingStrategy = .base64
                
                if let loginResponse = try? decoder.decode(LoginResponse.self, from: data) {
                    onSuccess(loginResponse)
                    return
                }

                onError(APIClientError.cantParseData)

            case .failure(let error):
                onError(error)
            }
        }
    }
 
    
    // MARK: - Subscribe
    
    static func subscribe(parameters: SubscribeParameters, accessToken: String, onSuccess: @escaping (SubscribeResponse) -> Void, onError: @escaping (Error) -> Void) {
    
        let url = URL(string: "\(Constants.URL.SUBSCRIBE)")!
        let resource = NetworkPOSTResource(url: url)
        let subscribeHeader = SubscribeHeader(accessToken: accessToken).dictionary
        let encodedParameters = parameters.dictionary

        NetworkService.loadPost(resource, header: subscribeHeader, parameters: encodedParameters) { (result) in
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dataDecodingStrategy = .base64
                
                if let subscribeResponse = try? decoder.decode(SubscribeResponse.self, from: data) {
                    onSuccess(subscribeResponse)
                    return
                }

                onError(APIClientError.cantParseData)

            case .failure(let error):
                onError(error)
            }
        }
    }
}
