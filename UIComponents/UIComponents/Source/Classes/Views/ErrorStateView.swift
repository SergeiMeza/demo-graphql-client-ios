import UIKit
import SwifterSwift
import RxSwift
import RxCocoa

/// - V: |--VStackView[...]--|
/// - H: |--VStackView[...]--|
public class ErrorStateView: UIView {
  
  let reloadTitle = "Try again"
  
  private let disposeBag = DisposeBag()
  private let message: String
  
  private lazy var vStackView: UIStackView = {
    let sv = UIStackView(
      arrangedSubviews: [self.messageLabel, self.reloadButton, self.logoutButton],
      axis: .vertical,
      spacing: 16,
      alignment: .fill,
      distribution: .fillProportionally)
    return sv
  }()
  
  private lazy var messageLabel: UILabel = {
    let label = UILabel(text: self.message, style: .body)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.sizeToFit()
    return label
  }()
  
  private lazy var reloadButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(reloadTitle, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemPink
    button.cornerRadius = 8
    return button
  }()
  
  private lazy var logoutButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Out", for: .normal)
    button.setTitleColor(.white, for: .normal)
    if #available(iOS 13.0, *) {
      button.backgroundColor = UIColor.systemPink
    } else {
      button.backgroundColor = .systemPink
    }
    button.cornerRadius = 8
    return button
  }()
  
  public init(message: String, backgroundColor: UIColor = .systemBackground) {
    self.message = message
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(vStackView)
    vStackView.anchorCenterSuperview()
    vStackView.anchor(top: nil, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
    
    reloadButton.anchor(heightConstant: 50)
    logoutButton.anchor(heightConstant: 50)
  }
  
  public func setupReloadButtonTapListener(reloadHandler: @escaping () -> Void) {
    reloadButton.onButtonTap(action: reloadHandler, disposeBag: disposeBag)
  }
  
  public func setupLogOutButtonTapListeners(logoutHandler: @escaping () -> Void) {
    logoutButton.onButtonTap(action: logoutHandler, disposeBag: disposeBag)
  }
}
