import RxSwift
import RxCocoa
import IGListKit

open class GenericListViewModel<T: Codable & ListDiffable>: Refreshable {

  public init() { }
  
  public let state = BehaviorRelay<LoadingState>(value: .loading)
  public let refreshing = BehaviorRelay<Bool>(value: false)
  public let items = BehaviorRelay<[T]>(value: [])
  public var lastValue: T?
  public var busy = false
  public var listItems = [T]()
  public var isCompleted = false

  public var currentItems: Driver<[T]> {
    return items.asDriver()
  }

  public var loadingState: Driver<LoadingState> {
    return state.asDriver()
  }

  public var refreshingState: Driver<Bool> {
    return refreshing.asDriver().filter { !$0 }
  }

  /// set list items (if prefetched)
  ///
  ///     loadFromLocalDatabase(collection: String)
  ///     ...
  ///
  open func prefetchItems() {
    print(String(describing: self), "method: prefetchItems", "Not implemented")
  }

  open func viewDidLoad() {
    if listItems.isEmpty {
      state.accept(.loading)
      fetch { _ in }
    } else {
      setItems()
    }
  }

  /// viewWillDisappear
  ///
  ///     saveToLocalDatabase(collection: String, removePreviousDocuments: Bool)
  ///     ...
  ///
  open func viewWillDisappear() {
    print(String(describing: self), "method: viewWillDisappear", "Not implemented")
  }

  open func reconnect() {
    lastValue = nil
    listItems.removeAll()
    state.accept(.loading)
    fetch { _ in }
  }

  open func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    lastValue = nil
    isCompleted = false
    listItems.removeAll()
    refreshing.accept(true)
    fetch { _ in }
  }

  open func loadMore() {
    if busy || isCompleted { return }
    fetch { _ in }
  }

  /// set list items (if prefetched)
  ///
  ///     let success = preloadItems()
  ///     let userArray = UserArray(users: users)
  ///     let diffalable = [userArray] as [ListDiffable]
  ///     items.accept(diffalable)
  ///
  open func setItems() {
    
  }

  /// set list items (if prefetched)
  ///
  ///     busy = true
  ///     Service.users.getUsers() {
  ///       ...
  ///       self?.state.accept(.success)
  ///       self?.refreshing.accept(false)
  ///       self?.busy = false
  ///       ...
  ///     }
  ///
  open func fetch(completion: @escaping (Result<(), Error>) -> Void) {
    
  }
}
