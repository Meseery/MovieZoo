import Foundation
import APILayer

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    weak var presenter: MovieDetailInteractorOutputProtocol?

    func makeMovieDetailRequest(movieTitle: String) {
        MovieDetailRequest(movieTitle: movieTitle).response { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onMovieDetailSuccess(moviePhotos: response.photos.photo)
                break
            case .failure(let error):
                self?.presenter?.onMovieDetailError(error: error)
                break
            }
        }
    }
}

class MovieDetailRequest: APIRequest<FlickrPhotoResponse> {
    var movieTitle: String
    
    init(movieTitle: String) {
        self.movieTitle = movieTitle
        super.init(route: MovieRoute.movieDetail(title: movieTitle).asRoute)
    }

    override func getParameters() -> [String : Any] {
        return [ "method": "flickr.photos.search",
                 "api_key": APIConstants.APIKey,
                 "format": "json",
                 "nojsoncallback": 1,
                 "text": movieTitle,
                 "per_page": 10,
                 "page": 1]
    }
}

enum MovieRoute {
    case movieDetail(title: String)
}

extension MovieRoute {
    
    private var baseUrl: String { APIConstants.APIBaseURL }
    
    private var apiEndPoint: String { "\(baseUrl)/\(urlPath)" }
    
    private var urlPath: String { "services/rest/" }

    var url: URL { URL(string: apiEndPoint)! }
    
    var asRoute: APIRoute { APIRoute.getRoute(path: apiEndPoint) }
}

class APIConstants {
    static let APIBaseURL = "https://www.flickr.com"
    static let APIKey = "60e67fad8edf2cb96da3562f539fb5b5"
}
