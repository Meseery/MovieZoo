import Foundation

class MovieSearchInteractor: MovieSearchInteractorProtocol {
    weak var presenter: MovieSearchInteractorOutputProtocol?
    
    private var movies: [Movie] = []
    private var moviesResults: [MovieSearchResult] = []
    
    private var dataManager: LocalDataManager<[Movie]>?
    
    func allMovieSearchResults() -> [MovieSearchResult] { self.moviesResults }

    init(movies: [Movie]? = []) {
        self.movies = movies ?? []
    }
    
    init(dataManager: LocalDataManager<[Movie]>? = LocalDataManager<[Movie]>()) {
        self.dataManager = dataManager
        self.movies = dataManager?.loadData(from: "movies") ?? []
    }

    func movieSearchResult(at indexPath: IndexPath) -> MovieSearchResult? { moviesResults[indexPath.section] }
    
    func searchMovie(searchText: String) {
        guard searchText.count >= 3 else { return }
        moviesResults.removeAll()
        let searchResults = movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        let years = Set(searchResults.compactMap {$0.year})
        years.forEach { year in
            let yearMovies = Array(searchResults
            .filter {$0.year == year}
            .sorted {$0.rating > $1.rating}
            .prefix(5))
            moviesResults.append((year, yearMovies))
        }
        if moviesResults.count == 0 {
            presenter?.onMovieSearchFailure(error: .emptyData)
        } else {
            presenter?.onMovieSearchSuccess(searchResults: moviesResults)
        }
    }
}
