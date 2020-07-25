import Foundation
import APILayer

class MovieDetailRequest: APIRequest<FlickrPhotoResponse> {
    var movieTitle: String
    
    init(movieTitle: String) {
        self.movieTitle = movieTitle
        super.init(route: MovieRoute.movieDetail(title: movieTitle).asRoute)
    }

    override func getParameters() -> [String : Any] {
        return [ "method": "flickr.photos.search",
                 "api_key": FlickrAPIConstants.key,
                 "format": "json",
                 "nojsoncallback": 1,
                 "text": movieTitle,
                 "per_page": 10,
                 "page": 1]
    }
}
