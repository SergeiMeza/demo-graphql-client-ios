import UIKit
import UIComponents
import RxSwift

public final class SongChartViewModel: GenericListViewModel<AppleMusicAPIClient.SongChart> {
  
  private let disposeBag = DisposeBag()
  
  public override func prefetchItems() {
    
  }
  
  public override func setItems() {
    
  }
  
  public override func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    refreshing.accept(true)
    fetch { _ in }
  }
  
  public override func fetch(completion: @escaping (Result<(), Error>) -> Void) {
    let language = UIApplication.shared.languageCode
    let storefront = UIApplication.shared.countryCode
    AppleMusicAPIClient.fetchSongCharts(storefront: storefront, language: language, limit: 100, offset: 0) { [weak self] result in
      guard case let .success(chart) = result else {
        self?.state.accept(.failure)
        return
      }
      self?.items.accept([chart])
      self?.state.accept(.success)
    }
  }
}
