import UIKit
import UIComponents
import IGListKit
import RxSwift
import RxCocoa
import UIKit
import SnapKit
import Kingfisher

class MusicVideoChartViewController: StatefulListViewController<MusicVideoChartViewModel, MusicVideoChartViewDataSource, ListCollectionView> {
  init() {
    let successView = ListCollectionView()
    super.init(viewModel: MusicVideoChartViewModel(), successView: successView)
    self.successView.backgroundColor = .systemBackground
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
    collectionView.register(MusicVideoChartHeaderCell.self)
    collectionView.register(MusicVideoPreviewCell.self)
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

