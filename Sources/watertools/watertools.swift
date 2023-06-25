import SwiftUI

@available(iOS 13.0, *)
public struct OfflineAdBanner: View {
    @State private var showBanner = true
    
    public var body: some View {
        if showBanner {
            VStack {
                Text("Ad here")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    showBanner = false
                }
            }
        }
    }
}

