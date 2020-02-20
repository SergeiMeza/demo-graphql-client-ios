import UIKit

extension UINavigationController {
  
  static public func rootViewController(_ rootViewController: UIViewController) -> UINavigationController {
    return UINavigationController(rootViewController: rootViewController)
  }
  
  @discardableResult
  public func rootViewController(_ rootViewController: UIViewController) -> UINavigationController {
    self.viewControllers = [rootViewController]
    return self
  }
  
  @discardableResult
  public func viewControllers(_ controllers: UIViewController...) -> UINavigationController {
    self.viewControllers = controllers
    return self
  }
}
