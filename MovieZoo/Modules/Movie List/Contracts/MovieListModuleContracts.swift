import Foundation

protocol MovieListRouterProtocol: class {
    func pushMovieDetailScene(view: MovieListViewProtocol, movie: Movie)
}

protocol MovieListViewProtocol: BaseView, BaseUIViewController {
    var presenter: MovieListPresenterProtocol? { get set }
    
    func showMovieList()
}

protocol MovieListPresenterProtocol: BasePresenter, MovieListInteractorOutputProtocol {
    var view: MovieListViewProtocol? { get set }
    var interactor: MovieListInteractorProtocol? { get set }
    var router: MovieListRouterProtocol? { get set }
    
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