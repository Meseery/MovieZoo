import UIKit

class MovieSearchRouter: MovieSearchRouterProtocol {
    func dismiss(view: MovieSearchViewProtocol) {
        if let viewController = view as? UIViewController {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func pushMovieDetailScene(from view: UIViewController, movie: Movie) {
        let viewController = AppNavigationCordinator.buildMovieDetailModule(movie: movie)
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
