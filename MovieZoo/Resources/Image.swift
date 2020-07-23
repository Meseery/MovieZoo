import UIKit.UIImage

enum Image: String {
    case icEmptyState = "ic_empty_state"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
