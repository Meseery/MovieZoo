import Foundation
import APILayer

class MovieListInteractor: MovieListInteractorProtocol {
    weak var presenter: MovieListInteractorOutputProtocol?
    private var dataManager: LocalDataManager<[Movie]>?
        
    init(manager: LocalDataManager<[Movie]>) {
        self.dataManager = manager
    }
    
    func makeMovieListRequest() {
        if let movies = dataManager?.loadData(from: "movies") {
            self.presenter?.onMoviesFetchSuccess(movies: movies)
        } else {
            self.presenter?.onMoviesFetchError(error: APIError.emptyData)
        }
    }
}
