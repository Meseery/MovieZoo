import XCTest
@testable import MovieZoo

class MovieListInteractorMock: MovieListInteractorProtocol {
    weak var presenter: MovieListInteractorOutputProtocol?
    var requestCalled: Bool = false
    
    private var dataManager: LocalDataManager<[Movie]>?
    
    init(manager: LocalDataManager<[Movie]>) {
        self.dataManager = manager
    }
    
    func makeMovieListRequest()  {
        requestCalled = true
        if let movies = dataManager?.loadData(from: "movies") {
            self.presenter?.onMoviesFetchSuccess(movies: Array(movies.prefix(10)))
        } else {
            self.presenter?.onMoviesFetchError(error: APIError.emptyData)
        }
    }
}
