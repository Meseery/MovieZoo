import UIKit

class MovieListRouter: MovieListRouterProtocol {
    func pushMovieDetailScene(view: MovieListViewProtocol, movie: Movie) {
        let viewController = AppNavigationCordinator.buildMovieDetailModule(movie: movie)
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
