import UIKit

class AppNavigationCordinator {
    static func buildMovieListModule() -> UIViewController {
        let viewController = UIStoryboard(name: "MovieList", bundle: nil)
            .instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        
        let presenter: MovieListPresenterProtocol & MovieListInteractorOutputProtocol = MovieListPresenter()
        let interactor: MovieListInteractorProtocol = MovieListInteractor(manager: LocalDataManager<[Movie]>())
        let router: MovieListRouterProtocol = MovieListRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
    
    static func buildMovieDetailModule(movie: Movie) -> UIViewController {
        let viewController
            = UIStoryboard(name: "MovieDetail", bundle: nil)
            .instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController

        var presenter: MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol = MovieDetailPresenter(movie: movie)
        let interactor: MovieDetailInteractorProtocol = MovieDetailInteractor()
        let router: MovieDetailRouterProtocol = MovieDetailRouter()

        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }

    static func buildSearchMoviesModule() -> UIViewController {
        let viewController = MovieSearchResultViewController()
        
        var presenter: MovieSearchPresenterProtocol & MovieSearchInteractorOutputProtocol = MovieSearchPresenter()
        let interactor: MovieSearchInteractorProtocol = MovieSearchInteractor(dataManager: LocalDataManager<[Movie]>())
        let router: MovieSearchRouterProtocol = MovieSearchRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
}
