import IGListKit
import RxSwift
import RxCocoa

extension ListCollectionView {
  public func createEndScrollingObservable() -> Observable<(cell: UICollectionViewCell, at: IndexPath)> {
    return rx.willDisplayCell.filter({ cell, _ in cell is LoadingCell })
  }
}
