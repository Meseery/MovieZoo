import UIKit
import APILayer

typealias MovieSearchResult = (year:Int, movies: [Movie])

protocol MovieSearchRouterProtocol: class {
    func dismiss(view: MovieSearchViewProtocol)
    func pushMovieDetailScene(from view: UIViewController, movie: Movie)
}

protocol MovieSearchViewProtocol: BaseView {
    var presenter: MovieSearchPresenterProtocol? { get set }
    
    func showSearchResults(searchResults: [MovieSearchResult])
}

protocol MovieSearchPresenterProtocol {
    var view: MovieSearchViewProtocol? { get set }
    var interactor: MovieSearchInteractorProtocol? { get set }
    var router: MovieSearchRouterProtocol? { get set }
    
    func searchResultsCount() -> Int
    func searchResultsPerSection(section: Int) -> Int
    func didSearchMovie(searchText: String)
    func didSelectMovie(at indexPath: IndexPath)
    func movieSearchResult(at indexPath: IndexPath) -> MovieSearchResult?
    func movie(at indexPath: IndexPath) -> Movie?
}

protocol MovieSearchInteractorProtocol: class {
    var presenter: MovieSearchInteractorOutputProtocol? { get set }
    
    func searchMovie(searchText: String)
    func movieSearchResult(at indexPath: IndexPath) -> MovieSearchResult?
    func allMovieSearchResults() -> [MovieSearchResult]
}

protocol MovieSearchInteractorOutputProtocol: class {
    func onMovieSearchSuccess(searchResults: [MovieSearchResult])
    func onMovieSearchFailure(error: APIError)
}
