import UIKit

extension UIStackView {
  
  @discardableResult
  open func padding(_ margins: [Padding], amount: CGFloat) -> UIStackView {
    isLayoutMarginsRelativeArrangement = true
    
    margins.forEach { (padding) in
      switch padding {
      case .top:
        layoutMargins.top = amount
      case .left:
        layoutMargins.left = amount
      case .right:
        layoutMargins.right = amount
      case .bottom:
        layoutMargins.bottom = amount
      case .verticalMargins:
        layoutMargins.top = amount
        layoutMargins.bottom = amount
      case .horizontalMargins:
        layoutMargins.left = amount
        layoutMargins.right = amount
      case .allMargins:
        layoutMargins = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
      }
    }
    return self
  }
  
  @discardableResult
  open func addArrangedSubviews(_ views: UIView...) -> UIStackView {
    self.addArrangedSubviews(views)
    return self
  }
}
