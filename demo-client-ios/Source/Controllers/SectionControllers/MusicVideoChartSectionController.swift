import UIKit
import UIComponents
import IGListKit

class MusicVideoChartSectionController: ListBindingSectionController<AppleMusicAPIClient.MusicVideoChart>, ListBindingSectionControllerDataSource, ListBindingSectionControllerSelectionDelegate {
  override init() {
    super.init()
    dataSource = self
    selectionDelegate = self
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
    guard let object = object as? AppleMusicAPIClient.MusicVideoChart else { fatalError() }
    return [object] + object.musicVideos
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
    guard let collectionContext = collectionContext else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.MusicVideoChart: return collectionContext.dequeueReusableCell(self, forIndex: index) as MusicVideoChartHeaderCell
    case is AppleMusicAPIClient.MusicVideo: return collectionContext.dequeueReusableCell(self, forIndex: index) as MusicVideoPreviewCell
    default: fatalError()
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { fatalError() }
    switch viewModel {
    case is AppleMusicAPIClient.MusicVideoChart: return .init(width: width, height: 40)
    case is AppleMusicAPIClient.MusicVideo: return .init(width: width / 2, height: 200)
    default: return .zero
    }
  }
  
  func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel: Any) {
    switch viewModel {
    case is AppleMusicAPIClient.MusicVideoChart: return
    case let viewModel as AppleMusicAPIClient.MusicVideo:
      MusicManager.shared.play(musicVideoPreview: viewModel)
      return
    default: return
    }
  }
}
