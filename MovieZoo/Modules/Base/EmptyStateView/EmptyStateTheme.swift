import UIKit

class EmptyStateTheme {
    
    private(set) var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 17)
    private(set) var descLabelFont: UIFont = UIFont.systemFont(ofSize: 15)
    private(set) var retryButtonFont: UIFont = UIFont.systemFont(ofSize: 18)
    
    private(set) var retryButtonBackgroundColor: UIColor = UIColor.red
    private(set) var retryButtonTextColor: UIColor = UIColor.white
    private(set) var titleTextColor: UIColor =  UIColor.gray
    private(set) var descriptionTextColor: UIColor =  UIColor.gray
    private(set) var backgroundColor: UIColor = UIColor.white
    private(set) var roudedCorner: Bool = true
    
    public static let shared = EmptyStateTheme()
    
    public class Builder {
        private var theme = EmptyStateTheme()
        
        func titleFont(font: UIFont) -> Self {
            theme.titleLabelFont = font
            return self
        }
        
        func descFont(font: UIFont) -> Self {
            theme.descLabelFont = font
            return self
        }
        
        func retryButtonFont(font: UIFont) -> Self {
            theme.retryButtonFont = font
            return self
        }
        
        func backgroundColor(color: UIColor) -> Self {
            theme.backgroundColor = color
            return self
        }
        
        func titleTextColor(color: UIColor) -> Self {
            theme.titleTextColor = color
            return self
        }

        func descTextColor(color: UIColor) -> Self {
            theme.descriptionTextColor = color
            return self
        }
        
        func retryButtonBackgroundColor(color: UIColor) -> Self {
            theme.retryButtonBackgroundColor = color
            return self
        }

        func retryButtonTextColor(color: UIColor) -> Self {
            theme.retryButtonTextColor = color
            return self
        }
        
        func corners(rounded: Bool) -> Self {
            theme.roudedCorner = rounded
            return self
        }

        func build() -> EmptyStateTheme {
            return theme
        }
    }
    
}
