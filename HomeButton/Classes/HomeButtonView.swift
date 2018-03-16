// todo header comment here

import UIKit

public enum HomeButtonStyle {
    case classic
    case classicWhite
    case modern
    case modernWhite
}

public class HomeButtonView: UIControl {
    
    /// The style of home button.
    public var style: HomeButtonStyle = .modern {
        didSet {
            updateStyle()
        }
    }
    
    private var iconPath: UIBezierPath {
        let iconWidth = size.width * 0.4
        let pathOffset = (bounds.width - iconWidth) / 2
        return UIBezierPath(roundedRect: CGRect(x: pathOffset, y: pathOffset, width: iconWidth, height: iconWidth), cornerRadius: iconWidth * 0.2)
    }
    
    private lazy var iconShapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = iconPath.cgPath
        layer.strokeColor = UIColor(white: 0.5, alpha: 1).cgColor
        layer.lineWidth = 2
        return layer
    }()
    
    private let size = CGSize(width: 62, height: 62)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        layer.addSublayer(iconShapeLayer)
        addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
        updateStyle()
    }
    
    public override var intrinsicContentSize: CGSize {
        return size
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        iconShapeLayer.frame = bounds
        iconShapeLayer.path = iconPath.cgPath
    }
    
    @objc private func touchUpInsideAction() {
        // -[UIApplication suspend] gracefully closes app.
        // If selector is available, use that. Otherwise, call exit()
        let suspendSelector = NSSelectorFromString("suspend")
        if UIApplication.shared.responds(to: suspendSelector) {
            UIApplication.shared.perform(suspendSelector)
        } else {
            exit(EXIT_SUCCESS)
        }
    }
    
    private func updateStyle() {
        
        switch style {
        case .classic:
            ()
        case .classicWhite:
            ()
        case .modern:
            ()
        case .modernWhite:
            ()
        }
        
        backgroundColor = .black
        
    }
    
}
