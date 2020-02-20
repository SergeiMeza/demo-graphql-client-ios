import UIKit
import JGProgressHUD

public final class LoadingStateView: UIView {

  let loadingTitle = "Loading"
  
  private lazy var hudView = JGProgressHUD(style: .dark)

  public func stopIndicator() {
    hudView.dismiss()
  }

  public init(backgroundColor: UIColor = .systemBackground) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    setup()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  private func setup() {
//    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
//      [weak self] in
//      guard let self = self else { return }
//      self.hudView.textLabel.text = self.loadingTitle
//      self.hudView.show(in: self)
//    }
  }
}
