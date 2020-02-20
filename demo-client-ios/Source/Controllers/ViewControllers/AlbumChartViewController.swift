import UIKit
import UIComponents
import SnapKit
import IGListKit
import RxSwift
import RxCocoa
import Kingfisher

class AlbumChartViewController: StatefulListViewController<AlbumChartViewModel, AlbumChartViewDataSource, ListCollectionView> {
  init() {
    let successView = ListCollectionView()
    super.init(viewModel: AlbumChartViewModel(), successView: successView)
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
    collectionView.register(AlbumChartHeaderCell.self)
    collectionView.register(AlbumPreviewCell.self)
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
    }).disposed(by: disposeBag)
  }

}

