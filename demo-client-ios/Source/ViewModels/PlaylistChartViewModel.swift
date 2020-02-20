import UIKit
import UIComponents
import RxSwift

class PlaylistChartViewModel: GenericListViewModel<AppleMusicAPIClient.PlaylistChart> {

  private let disposeBag = DisposeBag()

  override func prefetchItems() {

  }

  override func setItems() {

  }

  override func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    fetch { _ in }
    refreshing.accept(true)
  }


  override func fetch(completion: @escaping (Result<(), Error>) -> Void) {
    AppleMusicAPIClient.fetchPlaylistCharts(storefront: "jp", language: "ja", limit: 40, offset: 0) { [weak self] result in
      guard case let .success(chart) = result else {
        self?.state.accept(.failure)
        return
      }
      self?.items.accept([chart])
      self?.state.accept(.success)
    }
  }
}
