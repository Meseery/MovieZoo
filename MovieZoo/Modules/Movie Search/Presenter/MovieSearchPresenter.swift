import UIKit

class MovieSearchPresenter: MovieSearchPresenterProtocol {
    weak var view: MovieSearchViewProtocol?
    var interactor: MovieSearchInteractorProtocol?
    var router: MovieSearchRouterProtocol?
        
    
    func viewDidLoad() {}
    
    func viewWillAppear() {}
    
    func didSearchMovie(searchText: String) {
        interactor?.searchMovie(searchText: searchText)
    }

    func didSelectMovie(at indexPath: IndexPath) {
        guard let view = view as? MovieSearchViewProtocol & UIViewController,
            let superViewController = view.presentingViewController,
            let movie = interactor?.movieSearchResult(at: indexPath)?.movies[indexPath.row] else { return }
        router?.pushMovieDetailScene(from: superViewController, movie: movie)
        router?.dismiss(view: view)
    }
    
    func movieSearchResult(at indexPath: IndexPath) -> MovieSearchResult? { interactor?.movieSearchResult(at: indexPath) }
    
    func searchResultsPerSection(section: Int) -> Int {
        return interactor?.allMovieSearchResults()[section].movies.count ?? 0
    }
    
    func searchResultsCount() -> Int {
        return interactor?.allMovieSearchResults().count ?? 0

    }
    
    func movie(at indexPath: IndexPath) -> Movie? {
        return interactor?.movieSearchResult(at: indexPath)?.movies[indexPath.row]
    }
}

extension MovieSearchPresenter: MovieSearchInteractorOutputProtocol {
    func onMovieSearchSuccess(searchResults: [MovieSearchResult]) {
        view?.hideErrorView()
        view?.showSearchResults(searchResults: searchResults)
    }
    
    func onMovieSearchFailure(error: APIError) {
        view?.showErrorView(type: .Custom(title: nil,
                                          desc: "No matching results found",
                                          image: Image.icEmptyState.image,
                                          buttonAction: nil))
    }
}
