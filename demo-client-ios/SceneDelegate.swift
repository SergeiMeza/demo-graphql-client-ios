import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      
      // MARK: - Setup API CLIENT
      AppleMusicAPIClient.setup(apolloClient: LollipopApollo.shared.client)
      
      
      // MARK: - Choose View Controller
//      window.rootViewController = UINavigationController(rootViewController: SongChartViewController())
      window.rootViewController = UINavigationController(rootViewController: MusicVideoChartViewController())
      
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

