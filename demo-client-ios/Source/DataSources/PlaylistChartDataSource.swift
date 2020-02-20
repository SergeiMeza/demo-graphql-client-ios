import UIKit
import UIComponents
import IGListKit

class PlaylistChartViewDataSource: NSObject, ListAdapterDataSource {
  var items = [ListDiffable]()

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch object {
    case is AppleMusicAPIClient.PlaylistChart:  return PlaylistChartSectionController()
    default: return LoadingSectionController()
    }
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
