import Foundation
import APILayer

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    
    private var movieDetailViewModel: MovieDetailViewModel?
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func viewDidLoad() {
        loadMovieDetail()
    }
    
    func viewWillAppear() {}
    
    
    private func loadMovieDetail() {
        view?.showLoading(message: "Loading...")
        interactor?.makeMovieDetailRequest(movieTitle: movie.title)
    }
    
    func viewAllCast() {
        router?.pushMovieCastScene(view: view!, movie: movie)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func onMovieDetailSuccess(moviePhotos: [FlickrPhoto]) {
        view?.hideLoading()
        movieDetailViewModel = MovieDetailViewModel(movieDetail: movie, moviePhotos: moviePhotos)
        view?.showMovieDetail(viewModel: movieDetailViewModel!)
    }
    
    func onMovieDetailError(error: APIError) {
        view?.hideLoading()
        view?.showErrorView(type: .Custom(title: nil, desc: error.description, image: Image.icEmptyState.image, buttonAction: "Retry"))
    }
}
