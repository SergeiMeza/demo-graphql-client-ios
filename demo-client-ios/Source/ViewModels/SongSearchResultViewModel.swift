import UIKit
import UIComponents
import RxSwift

class SongSearchResultViewModel: GenericListViewModel<AppleMusicAPIClient.SongSearch> {
  private let disposeBag = DisposeBag()
  
  func prefetchItems(searchTerm: String) {
    fetch(searchTerm: searchTerm)
  }
  
  override func setItems() {
    
  }
  
  override func refresh(completion: @escaping (Result<(), Error>) -> Void) {
    refreshing.accept(true)
  }
  
  func fetch(searchTerm: String) {
    let language = UIApplication.shared.languageCode
    let storefront = UIApplication.shared.countryCode
    AppleMusicAPIClient.searchSongs(storefront: storefront, term: searchTerm, language: language) { [weak self] result in
      guard case let .success(songs) = result else {
        if case let .failure(error) = result {
          print("🚀 error:", error)
        }
        self?.items.accept([])
        self?.state.accept(.success)
        return
      }
      let songSearch = AppleMusicAPIClient.SongSearch(searchTerm: searchTerm, songs: songs)
      self?.items.accept([songSearch])
      self?.state.accept(.success)
    }
  }
}
