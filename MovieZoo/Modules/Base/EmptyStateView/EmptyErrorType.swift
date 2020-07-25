import UIKit

enum EmptyErrorType {
    case NoNetwork
    case Custom(title: String?, desc: String?, image: UIImage?, buttonAction: String?)
    case OnlyTitle(title: String)
    case OnlyDesc(desc: String)

    
    var actionButton: String? {
        switch self {
        case .OnlyTitle:
            return nil
        case .Custom(_, _, _, let buttonAction):
            return buttonAction
        default:
            return "Retry"
        }
    }
    
    var title: String? {
        switch self {
        case .Custom(let title, _, _, _):
            return title
        case .OnlyTitle(let title):
            return title
        case .OnlyDesc(_):
            return nil
        case .NoNetwork:
            return ""
        }
    }
    
    var desc: String? {
        switch self {
        case .Custom(_, let desc, _, _):
            return desc
        case .OnlyTitle(_):
            return nil
        case .OnlyDesc(let desc):
            return desc
        case .NoNetwork:
            return ""
        }
    }
    
    var image: UIImage? {
        switch self {
        case .NoNetwork:
            return UIImage(named: "")
        case .OnlyTitle(_), .OnlyDesc(_):
            return nil
        case .Custom(_, _, let image, _):
            return image
        }
    }
}
