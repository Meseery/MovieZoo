import UIKit

class MovieDetailViewController: BaseUIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieCastLabel: UILabel!
    @IBOutlet weak var moviePhotosTitleLabel: UILabel!
    @IBOutlet weak var moviePhotosCollectionView: UICollectionView!
    private var flowLayout: UICollectionViewFlowLayout!

    
    var presenter: MovieDetailPresenterProtocol?
    var movieViewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override func setupUI() {
        moviePhotosCollectionView.delegate = self
        moviePhotosCollectionView.dataSource = self
        moviePhotosCollectionView.register(UINib(nibName: "MoviePhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoviePhotoCollectionViewCell")
        flowLayout = self.moviePhotosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        
        flowLayout.sectionHeadersPinToVisibleBounds = true
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(inset: 0)
        flowLayout.minimumInteritemSpacing = 0
        
        let itemSize: CGFloat = (UIScreen.main.bounds.width - 100 ) / 2
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        movieTitleLabel.numberOfLines = 0
        movieGenreLabel.numberOfLines = 0
    }
    
    override func setUITheme() {
        movieTitleLabel.font = UIFont.themeBoldFont(of: 24)
        movieYearLabel.font = UIFont.themeRegularFont(of: 16)
        movieGenreLabel.font = UIFont.themeRegularFont(of: 16)
        movieCastLabel.font = UIFont.themeMediumFont(of: 16)
        
        movieCastLabel.textColor = UIColor.darkText
        movieYearLabel.textColor = UIColor.darkText
        movieGenreLabel.textColor = UIColor.darkText
    }
}

extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewmodel = movieViewModel else { return 0 }
        let count = viewmodel.moviePhotosCount
        return count > 10 ? 10 : count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePhotoCollectionViewCell", for: indexPath) as! MoviePhotoCollectionViewCell
        cell.configure(moviePhoto: movieViewModel?.moviePhoto(at: indexPath), indexPath: indexPath)
        return cell
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func showMovieDetail(viewModel: MovieDetailViewModel) {
        self.movieViewModel = viewModel
        self.title = viewModel.movieTitleText
        movieTitleLabel.text = viewModel.movieTitleText
        movieGenreLabel.text = viewModel.movieGenreText
        movieYearLabel.text = viewModel.movieYearText
        movieCastLabel.text = viewModel.movieCastingText
        moviePhotosTitleLabel.text = viewModel.moviePhotosText
        movieCastLabel.numberOfLines = viewModel.movieCastCount > 2 ? 0 : 1
        moviePhotosCollectionView.reloadData()
    }
    
    func showErrorView(type: EmptyErrorType) {
        self.showError(type: type, delegate: nil)
    }
}
