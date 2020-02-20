import UIKit
import RxSwift
import RxCocoa

public final class RxRefreshControl: UIRefreshControl {

  private weak var refreshable: Refreshable?
  private let disposeBag = DisposeBag()

  private override init() {
    super.init()

    rx.controlEvent(.valueChanged)
      .asDriver()
      .drive(onNext: { [weak self] _ in
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
          self?.refreshable?.refresh { _ in
            self?.endRefreshing()
          }
        }
      }).disposed(by: disposeBag)
  }

  public convenience init(_ refreshable: Refreshable) {
    self.init()
    self.refreshable = refreshable
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init coder has not been implemented")
  }

  public func setupEndRefreshingListener(_ callback: (() -> Void)? = nil) {

    refreshable?.refreshingState
      .drive(onNext: { [weak self] _ in
        self?.endRefreshing()
        callback?()
      }).disposed(by: disposeBag)
  }

}
