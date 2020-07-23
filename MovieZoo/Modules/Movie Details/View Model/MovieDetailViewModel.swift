import Foundation

class MovieDetailViewModel {
    private var movieDetail: Movie
    private var moviePhotos: [FlickrPhoto]

    init(movieDetail: Movie, moviePhotos: [FlickrPhoto]) {
        self.movieDetail = movieDetail
        self.moviePhotos = moviePhotos
    }
    
    var movieTitleText: String {
        return movieDetail.title
    }

    var movieYearText: String {
        return "🕰" + "  " + "\(movieDetail.year)"
    }

    var movieGenreText: String {
        return  "📽" + "  " + movieDetail.genres.map { $0.rawValue }.joined(separator: ", ")
    }

    var movieCastingText: String {
        return "🎞" + "  " + movieDetail.cast.joined(separator: " ,")
    }
    
    var movieCastCount: Int {
        return self.movieDetail.cast.count
    }

    var moviePhotosText: String {
        return "Movie Photos (\(self.moviePhotos.count))"
    }
    
    var moviePhotosCount: Int {
        return self.moviePhotos.count
    }
    
    func moviePhoto(at indexPath: IndexPath) -> FlickrPhoto {
        return self.moviePhotos[indexPath.row]
    }
}
