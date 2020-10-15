
import Foundation

protocol NetworkResource {
    var url: URL { get }
    var method: String { get }
}

struct NetworkGETResource: NetworkResource {
    var url: URL
    var method: String = "GET"
}

struct NetworkPOSTResource: NetworkResource {
    var url: URL
    var method: String = "POST"
}
