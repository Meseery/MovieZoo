import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var layerView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor.lightText
        
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.font = UIFont.themeBoldFont(of: 20)
        movieTitleLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        
        movieYearLabel.numberOfLines = 0
        movieYearLabel.font = UIFont.themeSemiBoldFont(of: 18)
        movieYearLabel.textColor = UIColor.purple
        
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.font = UIFont.themeMediumFont(of: 18)
        movieGenreLabel.textColor = UIColor.purple.withAlphaComponent(0.5)
        
        layerView.backgroundColor = UIColor.orange.withAlphaComponent(0.10)
    }
    
    override func prepareForReuse() {
        movieTitleLabel.text = nil
        movieYearLabel.text = nil
        movieGenreLabel.text = nil
        movieRatingLabel.text = nil
    }
    
    public func configure(movie: Movie, indexPath: IndexPath) {
        movieTitleLabel.text = movie.title
        movieYearLabel.text = "🕰" + "  " + "\(movie.year)"
        movieGenreLabel.text = "📽" + "  " + movie.genres.map {$0.rawValue}.joined(separator: " ,")
        movieRatingLabel.text = String(repeating: "⭐️", count: movie.rating > 5 ? 5 : movie.rating)
    }
}
