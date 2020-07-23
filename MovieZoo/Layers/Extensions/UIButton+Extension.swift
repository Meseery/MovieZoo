import UIKit

extension UIButton {
    func setTitleForAllStates(_ title: String?) {
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
        setTitle(title, for: .disabled)
        setTitle(title, for: .focused)
        setTitle(title, for: .highlighted)
    }
}
