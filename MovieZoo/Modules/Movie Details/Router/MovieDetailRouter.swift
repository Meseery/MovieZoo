import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    func pushMovieCastScene(view: MovieDetailViewProtocol, movie: Movie) {
        if let superViewController = view as? UIViewController {
            let viewController = AppNavigationCordinator.buildMovieDetailModule(movie: movie)
            superViewController.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
