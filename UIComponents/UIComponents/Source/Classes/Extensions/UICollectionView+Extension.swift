import UIKit
import RxSwift
import RxCocoa

public enum LoadingState: Int {
  case loading = 0
  case success = 1
  case failure = 2
  
  public func description() -> String {
    switch self {
    case .failure: return "failure"
    case .loading: return "loading"
    case .success: return "success"
    }
  }
}

public protocol Reusable: class {
  static var defaultReuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

public protocol NibLoadable: class {
  static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
}

public protocol Refreshable: class {
  var refreshingState: Driver<Bool> { get }
  var loadingState: Driver<LoadingState> { get }
  
  func refresh(completion: @escaping (Result<(), Error>) -> Void)
  func reconnect()
  func loadMore()
}

extension UICollectionView {
  
  public func removeRefreshing() {
    subviews.first(where: { $0 is UIRefreshControl })?.removeFromSuperview()
  }
  
  public func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
    self.register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  public func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    self.register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  public func register<T: UICollectionReusableView>(_: T.Type, supplementaryViewOfKind: String) where T: Reusable {
    self.register(T.self, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  public func register<T: UICollectionReusableView>(_: T.Type, supplementaryViewOfKind: String) where T: Reusable, T: NibLoadable {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    self.register(nib, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }
  
  public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind: String, indexPath: IndexPath) -> T where T: Reusable {
    guard let reusableView = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue UICollectionReusableView with identifier: \(T.defaultReuseIdentifier)")
    }
    return reusableView
  }
  
  public func reloadData(completion: @escaping () -> Void) {
    UIView.animate(withDuration: 0,
                   animations: { self.reloadData() },
                   completion: { _ in completion() }
    )
  }
}

extension UICollectionView {
  
  @discardableResult
  public func delegate(_ object: UICollectionViewDelegate) -> UICollectionView {
    self.delegate = object
    return self
  }
  
  @discardableResult
  public func datasource(_ object: UICollectionViewDataSource) -> UICollectionView {
    self.dataSource = object
    return self
  }
  
  @discardableResult
  public func allowsSelection(_ selection: Bool) -> UICollectionView {
    self.allowsSelection = selection
    return self
  }
  
  @discardableResult
  public func registerCell<T: UICollectionViewCell>(_: T.Type) -> UICollectionView where T: Reusable  {
    self.register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    return self
  }
  
  @discardableResult
  public func registerView<T: UICollectionReusableView>(_: T.Type, supplementaryViewOfKind: String) -> UICollectionView where T: Reusable {
    self.register(T.self, forSupplementaryViewOfKind: supplementaryViewOfKind, withReuseIdentifier: T.defaultReuseIdentifier)
    return self
  }
}

public class CollectionViewScrollDelegate: NSObject, UIScrollViewDelegate {
  
  let threshold: CGFloat
  let sleepTime: UInt32
  
  public init(distanceThreshold: CGFloat = 200, sleepTime: UInt32 = 2, listener: (() -> Void)? = nil) {
    self.threshold = distanceThreshold
    self.sleepTime = sleepTime
    self.listener = listener
    super.init()
    
  }
  
  private var listener: (() -> Void)?
  
  public func scrollViewWillEndDragging(
    _ scrollView: UIScrollView,
    withVelocity velocity: CGPoint,
    targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    
    if distance < threshold {
      DispatchQueue.global(qos: .default).async { [weak self] in
        sleep(self?.sleepTime ?? 2)
        DispatchQueue.main.async {
          self?.listener?()
        }
      }
    }
  }
  
  public func setupEndScrollingListener(_ listener: @escaping (() -> Void)) {
    self.listener = listener
  }
}
