import UIKit
import UIComponents
import IGListKit

class PlaylistChartSectionController: ListBindingSectionController<AppleMusicAPIClient.PlaylistChart>, ListBindingSectionControllerDataSource, ListBindingSectionControllerSelectionDelegate {
  override init() {
    super.init()
    dataSource = self
    selectionDelegate = self
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
    guard let object = object as? AppleMusicAPIClient.PlaylistChart else { fatalError() }
    return [object] + object.playlists
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
    guard let collectionContext = collectionContext else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.PlaylistChart: return collectionContext.dequeueReusableCell(self, forIndex: index) as PlaylistChartHeaderCell
    case is AppleMusicAPIClient.Playlist: return collectionContext.dequeueReusableCell(self, forIndex: index) as PlaylistPreviewCell
    default: fatalError()
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.PlaylistChart: return .zero
    case is AppleMusicAPIClient.Playlist: return .init(width: width, height: 80)
    default: return .zero
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel: Any) {
    switch viewModel {
    case is AppleMusicAPIClient.PlaylistChart: return
    case let viewModel as AppleMusicAPIClient.Playlist:
//      print(viewModel.)
      viewController?.navigationController?.pushViewController(UIViewController())
      return
    default: return
    }
  }
}
