import SwiftUI

struct SampleSwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        SampleSwiftUIView()
        SampleSwiftUIView()
        .environment(\.colorScheme, .dark)
        
      }
        
    }
}
