import IGListKit

public final class LoadingSectionController: ListSectionController {
  private var isCompleted: Bool = true

  public override func numberOfItems() -> Int {
    return isCompleted ? 0 : 1
  }

  public override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext?.containerSize.width ?? 0,
                  height: 100)
  }

  public override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let context = collectionContext else {
      fatalError("context is nil")
    }
    let cell: LoadingCell = context.dequeueReusableCell(self, forIndex: index)
    return cell
  }

  public override func didUpdate(to object: Any) {
    isCompleted = object as? Bool ?? true
  }
}
