import Foundation
import APILayer

protocol MovieDetailRouterProtocol: class {
    func pushMovieCastScene(view: MovieDetailViewProtocol, movie: Movie)
}

protocol MovieDetailViewProtocol: BaseView {
    var presenter: MovieDetailPresenterProtocol? { get set }
    
    func showMovieDetail(viewModel: MovieDetailViewModel)
}

protocol MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }

    func viewDidLoad()
    func viewAllCast()
}

protocol MovieDetailInteractorProtocol: class {
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    
    func makeMovieDetailRequest(movieTitle: String)
}

protocol MovieDetailInteractorOutputProtocol: class {
    func onMovieDetailSuccess(moviePhotos: [FlickrPhoto])
    func onMovieDetailError(error: APIError)
}
