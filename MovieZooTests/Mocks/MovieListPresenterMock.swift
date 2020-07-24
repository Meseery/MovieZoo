import XCTest
import APILayer

@testable import MovieZoo

class MovieListPresenterMock: MovieListPresenterProtocol {
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
    
    var movies: [Movie] = []
    var movieFetchSuccess: Bool = false
    var movieSelected: Bool = false
    var willDisplayCalled: Bool = false
        
    var moviesCount: Int { movies.count }

    func didSelectMovie(at indexPath: IndexPath) {
        movieSelected = true
        router?.pushMovieDetailScene(view: view!, movie: self.movie(at: indexPath))
    }
    
    func movie(at indexPath: IndexPath) -> Movie { movies[indexPath.row] }
    
    func viewDidLoad() { loadMovies() }
    
    func viewWillAppear() {}
    
    func onMoviesFetchSuccess(movies: [Movie]) {
        movieFetchSuccess = true
        self.movies = movies
        XCTAssertFalse(movies.isEmpty)
        view?.showMovieList()
    }
    
    func onMoviesFetchError(error: APIError) {
         movieFetchSuccess = false
    }
    
    private func loadMovies() {
        interactor?.makeMovieListRequest()
    }
}
