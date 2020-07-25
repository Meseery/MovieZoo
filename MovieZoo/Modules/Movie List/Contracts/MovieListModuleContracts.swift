import Foundation
import APILayer

protocol MovieListRouterProtocol: class {
    func pushMovieDetailScene(view: MovieListViewProtocol, movie: Movie)
}

protocol MovieListViewProtocol: BaseView, BaseUIViewController {
    var presenter: MovieListPresenterProtocol? { get set }
    
    func showMovieList()
}

protocol MovieListPresenterProtocol: MovieListInteractorOutputProtocol {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    
    func viewDidLoad()
    
    var moviesCount: Int { get }
    func movie(at indexPath: IndexPath) -> Movie
    func didSelectMovie(at indexPath: IndexPath)
}

protocol MovieListInteractorProtocol: class {
    var presenter: MovieListInteractorOutputProtocol? { get set }
    
    func makeMovieListRequest()
}

protocol MovieListInteractorOutputProtocol: class {
    func onMoviesFetchSuccess(movies: [Movie])
    func onMoviesFetchError(error: APIError)
}
