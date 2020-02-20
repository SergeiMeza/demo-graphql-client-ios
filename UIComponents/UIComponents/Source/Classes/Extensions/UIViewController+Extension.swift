import UIKit

extension UIViewController {
  @discardableResult
  public func modalPresentationStyle(_ style: UIModalPresentationStyle) -> UIViewController {
    self.modalPresentationStyle = style
    return self
  }
  
  @discardableResult
  public func presentFrom(_ controller: UIViewController, animated: Bool) -> UIViewController {
    controller.present(self, animated: true)
    return self
  }
  
  @discardableResult
  public func pushFrom(_ controller: UINavigationController) -> UIViewController {
    controller.pushViewController(self)
    return self
  }
  
  @discardableResult
  public func title(_ text: String) -> UIViewController {
    self.title = text
    return self
  }
  
  @discardableResult
  public func navigationTitle(_ text: String) -> UIViewController {
    self.navigationItem.title = text
    return self
  }
  
  @discardableResult
  public func tabBarTitle(_ text: String) -> UIViewController {
    self.tabBarItem.title = text
    return self
  }
  
  @discardableResult
  public func tabImage(_ image: UIImage) -> UIViewController {
    self.tabBarItem.image = image
    return self
  }
}

