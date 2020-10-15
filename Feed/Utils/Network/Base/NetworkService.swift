
import Foundation

typealias Header = [String: Any]
typealias Parameters = [String: Any?]


public class NetworkService {
    
    static func loadPost(_ resource: NetworkPOSTResource, header: Header? = nil, parameters: Parameters? = nil, result: @escaping ((NetworkResult<Data>) -> Void)) {
        
        guard Reachability.currentReachabilityStatus != .notReachable else {
            result(.failure(APIClientError.noInternet))
            return
        }

        var request = URLRequest(resource)

        // Add Headers
        if let header = header {
            for (key, value) in header {
                request.setValue(value as? String, forHTTPHeaderField: key)
            }
        }
        
        // Add Post Parameters
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }

        // Execute
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    result(.failure(APIClientError.noData))
                    return
                }
            
                if let error = error {
                    result(.failure(error))
                    return
                }
            
                result(.success(data))
            }
        }
        task.resume()
    }
}
