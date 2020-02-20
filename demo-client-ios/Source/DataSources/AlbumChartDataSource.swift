import UIKit
import UIComponents
import IGListKit

class AlbumChartViewDataSource: NSObject, ListAdapterDataSource {
  var items = [ListDiffable]()

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch object {
    case is AppleMusicAPIClient.AlbumChart:  return AlbumChartSectionController()
    default: return LoadingSectionController()
    }
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
