import SwifterSwift
import UIKit
import SnapKit
//import RxSwift
//import RxCocoa

public class AppNavigationController: UINavigationController {
  
  public override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    setupNavBar()
  }
  
  public required init?(coder: NSCoder) { fatalError() }
  
  private func setupNavBar() {
    navigationBar.backgroundColor = .systemBackground
    navigationBar.barTintColor = .systemBackground
    navigationBar.tintColor = .label
    navigationBar.shadowImage = UIImage()
    navigationBar.setBackgroundImage(UIImage(), for: .default)
  }
  
  public func setupStatusBarBackground(color: UIColor) {
    let safeAreaTop = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
    UIView()
      .setBackground(color: color)
      .addTo(view: view)
      .makeConstraints { make in
        make.top.equalToSuperview()
        make.leading.equalToSuperview()
        make.trailing.equalToSuperview()
        make.height.equalTo(safeAreaTop)
    }
  }
}

