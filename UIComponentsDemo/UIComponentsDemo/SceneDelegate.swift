import UIKit
import SwiftUI
import UIComponents

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = AppNavigationController(rootViewController: SampleViewController())
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

