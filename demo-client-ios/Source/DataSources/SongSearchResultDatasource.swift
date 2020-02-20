import UIKit
import UIComponents
import IGListKit

class SongSearchResultDatasource: NSObject, ListAdapterDataSource {
  var items = [ListDiffable]()

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch object {
    case is AppleMusicAPIClient.SongSearch:  return SongSearchSectionController()
    default: return LoadingSectionController()
    }
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
