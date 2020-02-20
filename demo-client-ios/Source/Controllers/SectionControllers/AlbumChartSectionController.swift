import UIKit
import UIComponents
import IGListKit

class AlbumChartSectionController: ListBindingSectionController<AppleMusicAPIClient.AlbumChart>, ListBindingSectionControllerDataSource, ListBindingSectionControllerSelectionDelegate {
  override init() {
    super.init()
    dataSource = self
    selectionDelegate = self
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
    guard let object = object as? AppleMusicAPIClient.AlbumChart else { fatalError() }
    return [object] + object.albums
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
    guard let collectionContext = collectionContext else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.AlbumChart: return collectionContext.dequeueReusableCell(self, forIndex: index) as AlbumChartHeaderCell
    case is AppleMusicAPIClient.Album: return collectionContext.dequeueReusableCell(self, forIndex: index) as AlbumPreviewCell
    default: fatalError()
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.AlbumChart: return .init(width: width, height: 40)
    case is AppleMusicAPIClient.Album: return .init(width: width, height: 80)
    default: return .zero
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel: Any) {
    switch viewModel {
    case is AppleMusicAPIClient.AlbumChart: return
    case let viewModel as AppleMusicAPIClient.Album: return
    default: return
    }
  }
}
