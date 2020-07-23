import XCTest
@testable import MovieZoo

class MovieListViewMock: BaseUIViewController, MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol?
    var showMovies: Bool = false
    var isLoading: Bool = false
    
    init(presenter: MovieListPresenterProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func showMovieList() { showMovies = true }
    
    func showErrorView(type: EmptyErrorType) {}
    
    func hideLoading() { isLoading = false }
}
