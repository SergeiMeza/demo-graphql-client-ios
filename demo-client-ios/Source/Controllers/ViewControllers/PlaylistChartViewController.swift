import UIKit
import UIComponents
import IGListKit
import RxSwift
import RxCocoa
import UIKit
import SnapKit
import Kingfisher

class PlaylistChartViewController: StatefulListViewController<PlaylistChartViewModel, PlaylistChartViewDataSource, ListCollectionView> {
  
  init() {
    let successView = ListCollectionView()
    super.init(viewModel: PlaylistChartViewModel(), successView: successView)
    self.successView.backgroundColor = UIColor.systemBackground
    self.viewModel.prefetchItems()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.prefetchItems()
    viewModel.viewDidLoad()
    collectionView.register(LoadingCell.self)
    collectionView.register(PlaylistChartHeaderCell.self)
    collectionView.register(PlaylistPreviewCell.self)
  }

  override func setupSubviews() {
    super.setupSubviews()
  }

  override func setupListener() {
    super.setupListener()

    viewModel.currentItems.drive(onNext: { [weak self] items in
      guard let self = self else { return }
      self.dataSource.items = items
      self.adapter.performUpdates(animated: true)
      self.refreshControl.endRefreshing()
      self.collectionView.layoutIfNeeded()
      self.title = items[safe: 0]?.name
    }).disposed(by: disposeBag)
  }
}
