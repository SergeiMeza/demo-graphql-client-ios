import UIComponents
import UIKit
import IGListKit

class BaseListCollectionViewCell<Model: ListDiffable>: PrototypeCollectionViewCell, ListBindable {
  var modelItem: Model?
  
  func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? Model else { return }
    self.modelItem = viewModel
    bindUI()
  }

  func updateUIlocally(newModelItem: Model) {

  }
}

class BaseCollectionViewCell<ViewModel>: PrototypeCollectionViewCell {
  var modelItem: ViewModel?
  
  func bindViewModel(_ viewModel: ViewModel) {
    self.modelItem = viewModel
    bindUI()
  }
}

