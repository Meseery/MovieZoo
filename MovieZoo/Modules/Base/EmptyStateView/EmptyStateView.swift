import UIKit.UIView

protocol EmptyStateViewDelegate: class {
    func retryButtonTapped()
}

class EmptyStateView: UIView {
    private weak var delegate: EmptyStateViewDelegate?
    private var theme: EmptyStateTheme = EmptyStateTheme.shared
    
    private var emptyImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private var emptyImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var retryButton: UIButton = {
        let button = UIButton()
        button.setTitleForAllStates("Retry")
        button.contentEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    private var actionButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setTheme()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        emptyImageContainer.setSubviewForAutoLayout(emptyImageView)
        actionButtonContainer.setSubviewForAutoLayout(retryButton)
        let stackView = UIStackView(arrangedSubviews: [emptyImageContainer, titleLabel, descriptionLabel, actionButtonContainer])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill

        self.setSubviewForAutoLayout(stackView)
        
        NSLayoutConstraint.activate([
            emptyImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: 1),
            emptyImageView.heightAnchor.constraint(equalTo: emptyImageView.widthAnchor),
            emptyImageView.topAnchor.constraint(equalTo: emptyImageContainer.topAnchor),
            emptyImageView.bottomAnchor.constraint(equalTo: emptyImageContainer.bottomAnchor),
            emptyImageView.centerXAnchor.constraint(equalTo: emptyImageContainer.centerXAnchor),
            
            retryButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5, constant: 1),
            retryButton.topAnchor.constraint(equalTo: actionButtonContainer.topAnchor, constant: 15),
            retryButton.bottomAnchor.constraint(equalTo: actionButtonContainer.bottomAnchor),
            retryButton.centerXAnchor.constraint(equalTo: actionButtonContainer.centerXAnchor),

            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    private func setTheme() {
        apply(theme: self.theme)
    }
    
    private func configure() {
        retryButton.isHidden = true
        retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
    }
    
    @objc private func retryButtonTapped() {
        delegate?.retryButtonTapped()
    }
    
    public func apply(theme: EmptyStateTheme) {
        self.theme = theme
        self.backgroundColor = theme.backgroundColor
        
        titleLabel.font = theme.titleLabelFont
        titleLabel.textColor = theme.titleTextColor
        
        descriptionLabel.font = theme.descLabelFont
        descriptionLabel.textColor = theme.descriptionTextColor
        
        retryButton.backgroundColor = theme.retryButtonBackgroundColor
        retryButton.titleLabel?.font = theme.retryButtonFont
    }
    
    @available(iOSApplicationExtension, unavailable, message: "This method is NS_EXTENSION_UNAVAILABLE.")
    func show() {
        let keyWindow = UIApplication.value(forKeyPath: #keyPath(UIApplication.shared.keyWindow))
        show(superview: keyWindow as? UIWindow)
    }
    
    public func delegate(with delegate: EmptyStateViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    
    public func with(title: String?, subTitle: String? = nil, image: UIImage? = nil) -> Self {
        emptyImageView.image = image
        titleLabel.text = title
        descriptionLabel.text = subTitle
        emptyImageContainer.isHidden = image == nil
        descriptionLabel.isHidden = subTitle == nil
        titleLabel.isHidden = title == nil
        return self
    }
        
    public func action(button retry: String? = nil) -> Self {
        if retry != nil {
            retryButton.isHidden = false
            retryButton.setTitleForAllStates(retry!)
        } else {
            retryButton.isHidden = true
        }
        return self
    }
    
    public func show(superview: UIView!) {
        self.frame = superview.bounds
        superview.addSubview(self)
        superview.bringSubviewToFront(self)
    }
    
    public func hide() {
        if self.superview != nil {
            self.removeFromSuperview()
        }
    }
}
