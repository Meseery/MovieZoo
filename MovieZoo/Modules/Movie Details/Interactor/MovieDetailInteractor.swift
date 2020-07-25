import Foundation
import APILayer

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    weak var presenter: MovieDetailInteractorOutputProtocol?

    func makeMovieDetailRequest(movieTitle: String) {
        MovieDetailRequest(movieTitle: movieTitle).response { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onMovieDetailSuccess(moviePhotos: response.photos.photo)
            case .failure(let error):
                self?.presenter?.onMovieDetailError(error: error)
            }
        }
    }
}
