import XCTest
@testable import MovieZoo

class MovieListRouterMock: MovieListRouterProtocol {
    var movieDetailSuccess: Bool = false
    
    func pushMovieDetailScene(view: MovieListViewProtocol, movie: Movie) {
        movieDetailSuccess = true
    }
}
