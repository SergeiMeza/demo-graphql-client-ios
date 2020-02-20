import UIKit
import IGListKit
import RxSwift
import RxCocoa

open class StatefulListViewController<ViewModel: Refreshable, DataSource: NSObject & ListAdapterDataSource, CollectionView: UICollectionView>: StatefulViewController<ViewModel, CollectionView>, UIScrollViewDelegate, UICollectionViewDelegate {
  
  public var collectionView: UICollectionView { return successView }
  
  public lazy var adapter: ListAdapter = ListAdapter(
    updater: ListAdapterUpdater(),
    viewController: self,
    workingRangeSize: 0)
  
  public let scrollDelegate = CollectionViewScrollDelegate()
  public let dataSource = DataSource()
  
  open override func loadView() {
    view = collectionView
  }
  
  open override func viewWillTransition(
    to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    coordinator.animate(alongsideTransition: { _ in
      self.collectionView.collectionViewLayout.invalidateLayout()
      self.collectionView.setNeedsLayout()
    })
  }
  
  open override func setupSubviews() {
    super.setupSubviews()
    collectionView.refreshControl = refreshControl
    collectionView.addSubview(refreshControl)
    collectionView.scrollsToTop = true
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    adapter.collectionView = collectionView
    adapter.dataSource = dataSource
    adapter.collectionViewDelegate = self
    adapter.scrollViewDelegate = self
    collectionView.backgroundColor = UIColor.systemBackground
  }
  
  open func scrollToTop(animated: Bool) {
    DispatchQueue.main.async { [weak self] in
      if self?.collectionView.numberOfItems() ?? 0 > 0 {
        self?.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: animated)
      }
    }
  }
  
  open override func setupListener() {
    super.setupListener()
    scrollDelegate.setupEndScrollingListener { [weak self] in
      self?.viewModel.loadMore()
    }
  }
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
  }
  
  open func scrollViewWillEndDragging(
    _ scrollView: UIScrollView,
    withVelocity velocity: CGPoint,
    targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    scrollDelegate.scrollViewWillEndDragging(
      scrollView,
      withVelocity: velocity,
      targetContentOffset: targetContentOffset)
  }
}
