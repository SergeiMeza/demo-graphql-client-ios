import UIKit
import UIComponents

class SampleViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view
      .setBackground(color: .systemBackground)
    
    UILabel()
      .text("Hello World!")
      .text(UIColor.label)
      .font(UIFont.systemFont(ofSize: 22, weight: .bold))
      .textAlignment(.center)
      .addTo(view: view)
      .makeConstraints { make in
        make.edges.equalToSuperview()
    }
    
    if let navController = navigationController as? AppNavigationController {
      navController.setupStatusBarBackground(color: .systemBackground)
    }
  }
}


#if DEBUG
import SwiftUI

struct SampleView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<SampleView>) -> AppNavigationController {
    return AppNavigationController(rootViewController: SampleViewController())
  }
  
  func updateUIViewController(_ uiViewController: AppNavigationController, context: UIViewControllerRepresentableContext<SampleView>) { }
}


struct SampleViewPreviews: PreviewProvider {
  static var previews: some View {
    SampleView()
  }
}
#endif
