import UIKit
import UIComponents
import IGListKit
import RxSwift
import RxCocoa
import UIKit
import SnapKit
import Kingfisher

class SongSearchResultViewController: StatefulListViewController<SongSearchResultViewModel, SongSearchResultDatasource, ListCollectionView> {
  
  let searchTerm: String
  
  init(searchTerm: String) {
    let successView = ListCollectionView()
    self.searchTerm = searchTerm
    super.init(viewModel: SongSearchResultViewModel(), successView: successView)
    self.successView.backgroundColor = UIColor.systemBackground
    title = searchTerm
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  lazy var searchResultsController: SongAutosuggestionsSearchResultsController = {
    let controller = SongAutosuggestionsSearchResultsController()
    controller.delegate = self
    return controller
  }()
  
  lazy var searchController: UISearchController = {
    let controller = UISearchController(searchResultsController: searchResultsController)
    controller.delegate = self
    controller.searchResultsUpdater = self
    return controller
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.searchController = searchController
    collectionView.register(LoadingCell.self)
    collectionView.register(SongChartHeaderCell.self)
    collectionView.register(SongPreviewCell.self)
    viewModel.fetch(searchTerm: searchTerm)
    searchController.searchBar.text = searchTerm
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    MusicManager.shared.stop()
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

extension SongSearchResultViewController: UISearchControllerDelegate {
  func didPresentSearchController(_ searchController: UISearchController) {
    print("🚀 didPresentSearchController")
  }
}

extension SongSearchResultViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let term = searchController.searchBar.trimmedText
    AppleMusicAPIClient.searchSongHints(storefront: UIApplication.shared.countryCode, term: term, language: UIApplication.shared.languageCode, limit: 20) { [weak self] result in
      switch result {
      case let .success(terms):
        self?.searchResultsController.update(autosuggestions: terms)
      case .failure:
        break
      }
    }
  }
}
extension SongSearchResultViewController: SongAutosuggestionsSearchResultsControllerDelegate {
  func didSelect(autosuggestion: String) {
    searchController.searchBar.text = nil
    let newSongChartViewController = SongSearchResultViewController(searchTerm: autosuggestion)
    navigationController?.pushViewController(newSongChartViewController) {
      newSongChartViewController.title = autosuggestion
      newSongChartViewController.searchController.searchBar.text = autosuggestion
    }
  }
}
