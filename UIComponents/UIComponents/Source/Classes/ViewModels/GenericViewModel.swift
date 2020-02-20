import RxSwift
import RxCocoa

open class GenericViewModel<T: Codable>: Refreshable {
  
  public init() { }
  
  public let state = BehaviorRelay<LoadingState>(value: .loading)
  public let refreshing = BehaviorRelay<Bool>(value: false)
  public let item = BehaviorRelay<T?>(value: nil)
  public var modelItem: T?
  public var updatedModelItem: T!
  public var busy = false
  public var isCompleted = false
  
  public var currentItem: Driver<T?> {
    return item.asDriver()
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
  ///     ... injected as dependency etc
  ///
  open func prefetchItem(_ genericItem: T?) {
    print(String(describing: self), "method: prefetchItem", "Not implemented")
  }
  
  open func viewDidLoad() {
    if modelItem == nil {
      state.accept(.loading)
    }
    fetch { _ in }
  }
  
  open func viewWillDisappear() {
    print(String(describing: self), "method: viewWillDisappear", "Not implemented")
  }
  
  open func reconnect() {
    modelItem = nil
    state.accept(.loading)
    fetch { _ in }
  }
  
  open func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    modelItem = nil
    isCompleted = false
    refreshing.accept(true)
    fetch { _ in }
  }
  
  open func loadMore() {
    if busy || isCompleted { return }
    fetch { _ in }
  }
  
  open func setItem() {
    print(String(describing: self), "method: setItem", "Override this method")
  }
  
  open func fetch(completion: @escaping (Result<(), Error>) -> Void) {
    print(String(describing: self), "method: fetch", "Override this method")
  }
}
