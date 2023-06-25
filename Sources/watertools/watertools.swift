import SwiftUI
import UIKit

public struct OfflineAdBanner: View {
    let ad: Ad
    @State private var counter = 3
    @State private var timer: Timer?
    @State private var closeAllowed: Bool = false
    @Environment(\.presentationMode) private var presentationMode

  
    public var body: some View {
            ScrollView {
                VStack {
                    HStack{
                        Image(ad.icon)
                            .resizable()
                            .foregroundColor(.accentColor)
                            .frame(width: 60, height: 60)
//                            .background(Color.gray.opacity(0.3))
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            Text(ad.name)
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .minimumScaleFactor(0.9)
                            Text(ad.subtitle)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        Button(action: {
                            openAppStore()
                        }, label: {
                            Text("Get App")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.accentColor)
                                .cornerRadius(15)
                        })
                    }
                    .padding()
//                    .background(Color.gray.opacity(0.1))
                    .background(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    HStack{
                        Text(ad.caption)
                            .font(.caption)
                            .padding()
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Button(action: {
                            closeAd()
                        }, label: {
                            HStack(spacing: 10){
                                Text("Skip Ad")
                                if closeAllowed {
                                    Image(systemName: "arrow.right.circle")
                                } else {
                                    Text(String(counter))
                                        .onAppear {
                                            startTimer()
                                        }
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(10)
//                            .background(Color.gray.opacity(0.3))
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .font(.caption)
                        })
                        .disabled(!closeAllowed)
                        .padding()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(ad.previews, id: \.self) { previewImage in
                                Image(previewImage)
                                    .resizable()
                                    .frame(width: 250, height: 500)
                                    .cornerRadius(30)
                            }
                        }.padding()
                    }
                    
                    Text(ad.description)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Button {
                        openAppStore()
                    } label: {
                        HStack{
                            Spacer()
                            Text("Get App")
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                        .padding()
                    }

                    
                }
            }
    }
    
    private func openAppStore() {
        guard let url = URL(string: ad.url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func startTimer() {
            guard timer == nil else { return }
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if counter > 0 {
                    counter -= 1
                } else {
                    timer?.invalidate()
                    timer = nil
                    closeAllowed = true
                }
            }
        }
        
        private func closeAd() {
            print("AD CLOSED")
            presentationMode.wrappedValue.dismiss()
        }
    
}

struct OfflineAdBanner_Previews: PreviewProvider {
    static var previews: some View {
        let randomAd = MyApps.randomElement()
        OfflineAdBanner(ad: randomAd!)
    }
}