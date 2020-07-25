import UIKit

class BaseUIViewController: UIViewController {
    
    private var emptyStateView: EmptyStateView = EmptyStateView()
    private var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUITheme()
        setupUI()
    }
    
    internal func setupUI() {
        // To-Be-Implemented by children views
    }
    
    internal func setUITheme() {
        // To-Be-Implemented by children views
    }
    
    func showLoadingView(msg: String) {
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        activityIndicator?.color = UIColor.purple
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.startAnimating()
        self.view.addSubview(activityIndicator!)
        self.view.bringSubviewToFront(activityIndicator!)
        
        activityIndicator?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func hideLoadingView() {
        activityIndicator?.removeFromSuperview()
    }
    
    func showError(type: EmptyErrorType, delegate: EmptyStateViewDelegate? = nil) {
        emptyStateView
            .delegate(with: delegate)
            .action(button: type.actionButton)
            .with(title: type.title, subTitle: type.desc, image: type.image)
            .show(superview: self.view)
    }
    
    func hideError() {
        if emptyStateView.superview != nil {
            emptyStateView.removeFromSuperview()
        }
    }
}
