import IGListKit

extension ListCollectionContext {
  
  public func dequeueReusableCell<T: UICollectionViewCell>(
    _ sectionController: ListSectionController,
    forIndex index: Int) -> T {
    guard let cell = dequeueReusableCell(
      of: T.self,
      for: sectionController,
      at: index) as? T else {
        fatalError("Could not dequeue cell with identifier: \(T.self)")
    }
    return cell
  }
  
  public func dequeueReusableCell<T: UICollectionViewCell>(
    _ sectionController: ListSectionController,
    forIndex: Int) -> T where T: Reusable, T: NibLoadable {
    let bundle = Bundle(for: T.self)
    
    guard let cell = dequeueReusableCell(
      withNibName: T.defaultReuseIdentifier,
      bundle: bundle,
      for: sectionController,
      at: forIndex) as? T
      else {
        fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    
    return cell
  }
  
  public func dequeueReusableCell<T: UICollectionViewCell>(
    _ sectionController: ListSectionController,
    forIndex: Int) -> T where T: Reusable {
    guard let cell = dequeueReusableCellFromStoryboard(
      withIdentifier: T.defaultReuseIdentifier,
      for: sectionController,
      at: forIndex) as? T else {
        fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }
}
