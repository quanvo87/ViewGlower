import UIKit

public class ViewGlower {
    private var glowViews = [Int: UIView]()

    public init() {}

    public func stopGlowing(_ view: UIView?) {
        guard let view = view else {
            return
        }
        let id = ObjectIdentifier(view).hashValue
        glowViews[id]?.removeFromSuperview()
        glowViews.removeValue(forKey: id)
    }

    public func glow(_ view: UIView?,
                     color: UIColor = UIColor.white,
                     from: CGFloat = 0,
                     to: CGFloat = 0.9,
                     duration: CFTimeInterval = 1,
                     shouldRepeat: Bool = true) {
        guard let view = view, view.isVisible else {
            return
        }

        let image = getImage(from: view, color: color)

        let glowView = UIImageView(image: image)
        glowView.alpha = 0
        glowView.center = view.center
        glowView.layer.shadowColor = color.cgColor
        glowView.layer.shadowOffset = CGSize.zero
        glowView.layer.shadowRadius = 10
        glowView.layer.shadowOpacity = 1.0

        let animation = CABasicAnimation(keyPath: "opacity")
        animation.autoreverses = true
        animation.duration = duration
        animation.fromValue = from
        animation.toValue = to
        animation.repeatCount = shouldRepeat ? .infinity : 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        glowView.layer.add(animation, forKey: "pulse")

        glowViews[ObjectIdentifier(view).hashValue] = glowView

        view.superview?.insertSubview(glowView, aboveSubview: view)
    }

    private func getImage(from view: UIView, color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)

        guard let context = UIGraphicsGetCurrentContext() else {
            print("UIGraphicsGetCurrentContext returned nil.")
            return UIImage()
        }

        view.layer.render(in: context)

        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))

        color.setFill()

        path.fill(with: .sourceAtop, alpha: 1.0)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            print("Error getting image from current image context.")
            return UIImage()
        }

        UIGraphicsEndImageContext()

        return image
    }

    deinit {
        for (_, view) in glowViews {
            view.removeFromSuperview()
        }
    }
}

// https://stackoverflow.com/questions/1536923/determine-if-uiview-is-visible-to-the-user
private extension UIView {
    var isVisible: Bool {
        if window == nil {
            return false
        }
        var currentView = self
        while let superview = currentView.superview {
            if !(superview.bounds).intersects(currentView.frame) {
                return false
            }
            if currentView.isHidden {
                return false
            }
            if currentView.alpha == 0 {
                return false
            }
            currentView = superview
        }
        return true
    }
}
