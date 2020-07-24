import UIKit
import APILayer

class MoviePhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        photoTitleLabel.font = UIFont.themeRegularFont(of: 12)
        photoTitleLabel.text = ""
        photoTitleLabel.textAlignment = .center
        photoTitleLabel.textColor = UIColor.black
        
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.masksToBounds = true
        roundImage()
        photoImageView.backgroundColor = UIColor.red.withAlphaComponent(0.12)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundImage()
    }
    
    func roundImage() {
        self.layoutIfNeeded()
        photoImageView.layer.cornerRadius = photoImageView.bounds.size.width/2
    }
    
    override func prepareForReuse() {
        photoTitleLabel.text = ""
        photoImageView.image = nil
    }
    
    func configure(moviePhoto: FlickrPhoto?, indexPath: IndexPath) {
        if let photo = moviePhoto {
            photoTitleLabel.text = photo.title
            photoImageView.load(url: photo.photoURL, indexPath: indexPath)
        }
        roundImage()
    }
}


