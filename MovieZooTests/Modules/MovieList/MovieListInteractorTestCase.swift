import XCTest
@testable import MovieZoo

class MovieListInteractorTestCase: XCTestCase {
    var interactor: MovieListInteractorProtocol!
    var presenter: MovieListPresenterMock!
    
    override func setUp() {
        presenter = MovieListPresenterMock()
        interactor = MovieListInteractor(manager: LocalDataManager<[Movie]>())
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
    }
    
    func testLoadMovies() {
        interactor.makeMovieListRequest()
        XCTAssertTrue(presenter.movieFetchSuccess)
    }
}
