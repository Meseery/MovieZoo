import Foundation
import APILayer

enum MovieRoute {
    case movieDetail(title: String)
}

extension MovieRoute {
    private var baseUrl: String { FlickrAPIConstants.baseURL }
    
    private var apiEndPoint: String { "\(baseUrl)/\(urlPath)" }
    
    private var urlPath: String { "services/rest/" }

    var url: URL { URL(string: apiEndPoint)! }
    
    var asRoute: APIRoute { APIRoute.getRoute(path: apiEndPoint) }
}
