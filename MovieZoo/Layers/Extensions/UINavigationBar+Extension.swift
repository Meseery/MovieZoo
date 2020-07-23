import UIKit

extension UINavigationBar {
    static func applyTheme() {
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = true
        appearance.backgroundColor = UIColor.white
        appearance.barTintColor = UIColor.white
        appearance.tintColor = UIColor.black
        appearance.barStyle = .default
        appearance.shadowImage = UIImage()
        
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = UIFont.themeMediumFont(of: 18)
        attrs[.foregroundColor] = UIColor.black
        
        appearance.titleTextAttributes = attrs
        
        var attrsBarButton = [NSAttributedString.Key: Any]()
        attrsBarButton[.font] = UIFont.themeRegularFont(of: 16)
        attrsBarButton[.foregroundColor] = UIColor.black
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        
        for state in [UIControl.State.normal, UIControl.State.focused, UIControl.State.highlighted, UIControl.State.selected] {
            barButtonAppearance.setTitleTextAttributes(attrsBarButton, for: state)
        }
    }
}
