import XCTest
@testable import MovieZoo

class MovieListInteractorOutputMock: MovieListInteractorOutputProtocol {
    var success = false
    
    func onMoviesFetchSuccess(movies: [Movie]) { success = true }
    func onMoviesFetchError(error: APIError) { success = false }
}
