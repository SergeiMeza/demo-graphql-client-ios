import UIKit
import UIComponents
import IGListKit

public class SongChartViewDataSource: NSObject, ListAdapterDataSource {
  var items = [ListDiffable]()

  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }

  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    switch object {
    case is AppleMusicAPIClient.SongChart:  return SongChartSectionController()
    default: return LoadingSectionController()
    }
  }

  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
