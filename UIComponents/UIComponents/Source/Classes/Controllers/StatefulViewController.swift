import UIKit
import SnapKit
import RxSwift
import RxCocoa

open class StatefulViewController<ViewModel: Refreshable, SuccessView: UIView>: BaseViewController {

  let networkErrorMessage = "Unstable Network. Check the network connection and try again."
  
  public var successView: SuccessView
  
  public var loadingView: LoadingStateView!
  public var errorView: ErrorStateView!
  

  public var viewModel: ViewModel
  public let disposeBag = DisposeBag()

  private var stateViews: [UIView] { return [loadingView, errorView] }

  public lazy var refreshControl: RxRefreshControl = RxRefreshControl(viewModel)

  public init(viewModel: ViewModel, successView: SuccessView) {
    self.viewModel = viewModel
    self.successView = successView
    super.init(nibName: nil, bundle: nil)
    loadingView = LoadingStateView(backgroundColor: .systemBackground)
    errorView = ErrorStateView(message: networkErrorMessage, backgroundColor: .systemBackground)
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func loadView() {
    view = successView
  }

  open override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
    setupListener()
  }

  open func setupSubviews() {
    view.addSubviews(stateViews)
    stateViews.forEach {
      $0.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      $0.isHidden = true
    }
  }

  open func setupListener() {
    errorView.setupReloadButtonTapListener {
      [weak self] in self?.viewModel.reconnect()
    }

    viewModel.loadingState.drive(onNext: { [weak self] state in
      guard let `self` = self else { return }
      if state == .success {
        self.stateViews.forEach { $0.isHidden = true }
      } else {
        self.stateViews[safe: state.rawValue]?.isHidden = false
      }
    }).disposed(by: disposeBag)
  }

  open func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    viewModel.refresh { result in completion(result) }
  }
}
