import UIKit

extension UIViewController {
    func presentOkAlert(title: String = "", message: String) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        presentAlert(title: title, message: message, preferredStyle: .alert, actionButtons: [okAction])
    }
    
    func presentAlert(title: String? = "", message: String?, preferredStyle: UIAlertController.Style = .alert, actionButtons: [UIAlertAction]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        for button in actionButtons {
            alert.addAction(button)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
