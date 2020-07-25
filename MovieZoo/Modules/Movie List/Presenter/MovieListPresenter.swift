import Foundation
import APILayer

class MovieListPresenter: MovieListPresenterProtocol {
    weak var view: MovieListViewProtocol?
    var interactor: MovieListInteractorProtocol?
    var router: MovieListRouterProtocol?
    
    var movies: [Movie] = []
    var moviesCount: Int { movies.count }
    
    func viewDidLoad() {
        loadMovieList()
    }
    
    func movie(at indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
    func didSelectMovie(at indexPath: IndexPath) {
        router?.pushMovieDetailScene(view: view!, movie: movies[indexPath.row])
    }

    private func loadMovieList() {
        view?.showLoading(message: "Loading...")
        interactor?.makeMovieListRequest()
    }
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
    func onMoviesFetchSuccess(movies: [Movie]) {
        let sortedList = movies.sorted(by: {$0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending})
        self.movies = sortedList
        view?.hideLoading()
        view?.showMovieList()
    }
    
    func onMoviesFetchError(error: APIError) {
        view?.hideLoading()
        view?.showErrorView(type: .OnlyTitle(title: error.description))
        view?.showErrorView(type: .Custom(title: nil, desc: error.description, image: Image.icEmptyState.image, buttonAction: nil))
    }
}
