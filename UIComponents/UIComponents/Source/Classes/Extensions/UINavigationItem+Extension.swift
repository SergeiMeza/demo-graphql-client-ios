import SwifterSwift
import UIKit
import SnapKit

extension UINavigationItem {
  
  public func setupTitleView(title: String, buttonsStackView: UIStackView) {
    self.setupTitleView(
      logoView: UILabel()
        .text(title)
        .font(.systemFont(ofSize: 28, weight: .bold)),
      buttonsStackView: buttonsStackView)
    self.title = title
  }
  
  public func setupTitleView(logoView: UIView, buttonsStackView: UIStackView) {
    let titleView = UIView()
      .setBackground(color: .clear)
    
    let titleViewStack = UIFactory
      .HStack(alignment: .fill, distribution: .fill, spacing: 0)
    
    titleViewStack
      .addTo(view: titleView)
      .makeConstraints { make in
        make.edges.equalToSuperview()
    }
    .setBackground(color: .clear)
    
    let width = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.frame.width ?? 0
    
    titleViewStack.addArrangedSubviews(
      logoView,
      UIView(),
      buttonsStackView)
      .setWidth(width - 16)
    self.titleView = titleView
  }
}
