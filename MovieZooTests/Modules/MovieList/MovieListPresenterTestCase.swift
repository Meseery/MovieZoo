import XCTest
@testable import MovieZoo

class MovieListPresenterTestCase: XCTestCase {
    var presenter: MovieListPresenterProtocol!
    var interactor: MovieListInteractorMock!
    var view: MovieListViewMock!
    var router: MovieListRouterMock!
    
    override func setUp() {
        let localDataManager = LocalDataManager<[Movie]>()
        presenter = MovieListPresenter()
        interactor = MovieListInteractorMock(manager: localDataManager)
        router = MovieListRouterMock()
        view = MovieListViewMock(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
        interactor = nil
        router = nil
    }
    
    func testShowLoadMovies() {
        presenter.viewDidLoad()
        wait(for: 2)
        XCTAssertTrue(interactor.requestCalled)

        XCTAssertTrue(view.showMovies)
        XCTAssertFalse(view.isLoading)
    }

    func testdidSelectMovie() {
        presenter.viewDidLoad()
        wait(for: 2)
        XCTAssertTrue(interactor.requestCalled)
        
        presenter.didSelectMovie(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(view.showMovies)
        XCTAssertTrue(router.movieDetailSuccess)
    }
}
