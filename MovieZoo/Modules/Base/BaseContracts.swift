import UIKit
protocol BaseView: class {
    func showErrorView(type: EmptyErrorType)
    func hideErrorView()
    func showErrorAlert(type: EmptyErrorType)
    func showErrorAlert(msg: String)
    
    func showLoading(message: String)
    func hideLoading()
    
    func showAlertSheet(title: String?, msg: String?, actions: [UIAlertAction])
    func showAlert(title: String?, msg: String?, actions: [UIAlertAction])
}

extension BaseView where Self: BaseUIViewController {
    
    func hideErrorView() {
        self.hideError()
    }
    
    func showErrorAlert(msg: String) {
        self.presentOkAlert(message: msg)
    }
    
    func showErrorAlert(type: EmptyErrorType) {
        self.presentOkAlert(title: type.title ?? "", message: type.desc ?? "")
    }
    
    func showLoading(message: String) {
        self.showLoadingView(msg: message)
    }
    
    func hideLoading() {
        self.hideLoadingView()
    }
    
    func showAlertSheet(title: String?, msg: String?, actions: [UIAlertAction]) {
        self.presentAlert(title: title, message: msg, preferredStyle: .actionSheet, actionButtons: actions)
    }
    
    func showAlert(title: String?, msg: String?, actions: [UIAlertAction]) {
        self.presentAlert(title: title, message: msg, preferredStyle: .alert, actionButtons: actions)
    }
}
