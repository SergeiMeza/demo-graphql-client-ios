import UIKit
import UIComponents

class SampleViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view
      .setBackground(color: .systemBackground)
    
    UIFactory.VStack()
      .addArrangedSubviews(
        UILabel()
          .text("Hello World!")
          .text(UIColor.label)
          .font(UIFont.systemFont(ofSize: 22, weight: .black))
          .textAlignment(.center)
          .addTo(view: view),
        UILabel()
          .text("Hello World!")
          .text(UIColor.label)
          .font(UIFont.systemFont(ofSize: 22, weight: .black))
          .textAlignment(.center)
          .addTo(view: view),
        UIView()
    )
      .addTo(view: view)
    .makeConstraints ({ make in
      make.top.equalToSuperview().inset(40)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    })
      
    
    
    
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
    Group {
      SampleView()
        .previewDevice(.init(rawValue: "iPhone SE"))
      SampleView()
        .environment(\.colorScheme, .dark)
      .previewDevice(.init(rawValue: "iPhone X"))
      
      
    }
    
  }
}
#endif
