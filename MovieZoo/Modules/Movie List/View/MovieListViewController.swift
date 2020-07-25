import UIKit

class MovieListViewController: BaseUIViewController {
    @IBOutlet weak var moviesCollectionView: UICollectionView!

    private let spacing: CGFloat = 18
    private var flowLayout: UICollectionViewFlowLayout!
    private var showCollectionViewLoadingFooter: Bool = false
    
    var presenter: MovieListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        presenter?.viewDidLoad()
    }
    
    override func setupUI() {
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        let activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .whiteLarge
        }
        activityIndicator.tintColor = UIColor.purple
        activityIndicator.startAnimating()
        
        moviesCollectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        flowLayout = self.moviesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.minimumLineSpacing = spacing
        flowLayout.sectionInset = UIEdgeInsets(inset: spacing)
        flowLayout.minimumInteritemSpacing = spacing
        
        let itemWidth: CGFloat = UIScreen.main.bounds.width - (2 * spacing)
        let itemHeight: CGFloat = itemWidth * (1/3)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        // Set SearchController
        let searchViewController = AppNavigationCordinator.buildSearchMoviesModule()
        let searchController = UISearchController(searchResultsController: searchViewController)
        if #available(iOS 11, *) {
            searchController.obscuresBackgroundDuringPresentation = true
        } else {
            searchController.dimsBackgroundDuringPresentation = true
        }
        definesPresentationContext = true
        searchController.searchResultsUpdater = nil
        searchController.searchBar.placeholder = "Search Movies ... "
        searchController.searchBar.delegate = searchViewController as? UISearchBarDelegate
        searchController.hidesNavigationBarDuringPresentation = true

        if #available(iOS 11, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.titleView = searchController.view
        }
        definesPresentationContext = true
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.moviesCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        if let movie = presenter?.movie(at: indexPath) {
            cell.configure(movie: movie, indexPath: indexPath)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectMovie(at: indexPath)
    }
}

extension MovieListViewController: MovieListViewProtocol {
    func showErrorView(type: EmptyErrorType) {
        self.showError(type: type, delegate: nil)
    }
    
    func showLoading(message: String) {
        showLoadingView(msg: message)
    }
    
    func hideLoading() {
        if showCollectionViewLoadingFooter {
            showCollectionViewLoadingFooter = false
        } else {
            hideLoadingView()
        }
    }
   
    func showMovieList() {
        moviesCollectionView.reloadSections(IndexSet(integer: 0))
    }
}
