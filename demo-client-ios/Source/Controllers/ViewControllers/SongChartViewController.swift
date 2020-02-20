import UIKit
import UIComponents
import IGListKit
import RxSwift
import RxCocoa
import UIKit
import SnapKit
import Kingfisher

public final class SongChartViewController: StatefulListViewController<SongChartViewModel, SongChartViewDataSource, ListCollectionView> {
  public init() {
    let successView = ListCollectionView()
    super.init(viewModel: SongChartViewModel(), successView: successView)
    self.successView.backgroundColor = UIColor.systemBackground
    self.viewModel.prefetchItems()
  }
  
  public lazy var closeBarButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: nil, action: nil)

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  lazy var searchResultsController: SongAutosuggestionsSearchResultsController = {
    let controller = SongAutosuggestionsSearchResultsController()
    controller.delegate = self
    return controller
  }()
  
  public lazy var searchController: UISearchController = {
    let controller = UISearchController(searchResultsController: searchResultsController)
    controller.delegate = self
    controller.searchResultsUpdater = self
    return controller
  }()
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.searchController = searchController
    viewModel.prefetchItems()
    viewModel.viewDidLoad()
    collectionView.register(LoadingCell.self)
    collectionView.register(SongChartHeaderCell.self)
    collectionView.register(SongPreviewCell.self)
    
    closeBarButton.rx.tap.subscribe { [unowned self] _ in
        self.dismiss(animated: true)
    }.disposed(by: disposeBag)
  }
  
  public override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    MusicManager.shared.stop()
  }

  public override func setupSubviews() {
    super.setupSubviews()
  }

  public override func setupListener() {
    super.setupListener()

    viewModel.currentItems.drive(onNext: { [weak self] items in
      guard let self = self else { return }
      self.dataSource.items = items
      self.adapter.performUpdates(animated: true)
      self.refreshControl.endRefreshing()
      self.collectionView.layoutIfNeeded()
      self.title = items[safe: 0]?.name
    }).disposed(by: disposeBag)
  }
}

extension SongChartViewController: UISearchControllerDelegate {
  public func didPresentSearchController(_ searchController: UISearchController) {
    print("🚀 didPresentSearchController")
  }
}

extension SongChartViewController: UISearchResultsUpdating {
  public func updateSearchResults(for searchController: UISearchController) {
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
extension SongChartViewController: SongAutosuggestionsSearchResultsControllerDelegate {
  public func didSelect(autosuggestion: String) {
    let newSongChartViewController = SongSearchResultViewController(searchTerm: autosuggestion)
    navigationController?.pushViewController(newSongChartViewController)
  }
}
