//
//  OfflineAdBanner.swift
//  
//
//  Created by yury mid on 26.06.2023.
//

import Foundation
import SwiftUI

public struct OfflineAdBanner: View {
    public var ad: Ad
    @State public var counter = 5
    @State public var timer: Timer?
    @State public var closeAllowed: Bool = false
    let onClose: () -> Void
    
    let githubURL = URL(string: "https://github.com/pieceowater")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/pieceowater/")!
    let tiktokURL = URL(string: "https://www.tiktok.com/@yurymid")!
    let resumeURL = URL(string: "https://pieceowater.github.io/resume/")!
    
    var locale = Locale.current.languageCode!
    @Environment(\.presentationMode) public var presentationMode
    public init(currentAppId: Int, onClose: @escaping () -> Void) {
        self.ad = MyApps.filter({ $0.id != currentAppId }).randomElement()!
        self.onClose = onClose
    }
    public var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Image(systemName: "chevron.left.slash.chevron.right")
                        .font(.caption)
                        .frame(width: 25, height: 25)
                        .background(.ultraThinMaterial)
                        .cornerRadius(50)
                        .foregroundColor(.accentColor)
                        .shadow(color: .gray.opacity(0.5), radius: 1)
                    Link("Pieceowater", destination: resumeURL)
                        .padding(.trailing, 10)
                }
                .padding(5)
                .background(.ultraThinMaterial)
                .cornerRadius(50)
                HStack {
                    Image(uiImage: UIImage(named: ad.icon, in: .module, with: nil) ?? UIImage())
                        .resizable()
                        .foregroundColor(.accentColor)
                        .frame(width: 60, height: 60)
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                    VStack(alignment: .leading) {
                        Text(ad.name[locale] ?? "")
                            .font(.title)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.9)
                        Text(ad.subtitle[locale] ?? "")
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .font(.subheadline)
                    }
                    Spacer()
                    
                    Button(action: {
                        openAppStore()
                    }, label: {
                        Text(localizedButtons["download_btn"]?[locale] ?? "Get App")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                    })
                }
                .padding()
                .background(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                HStack {
                    Text(ad.caption[locale] ?? "")
                        .font(.caption)
                        .padding()
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        print("DISMISS -2")
                        closeAd()
                    }, label: {
                        HStack(spacing: 10) {
                            Text(localizedButtons["skip_btn"]?[locale] ?? "Skip Ad")
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
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .font(.caption)
                    })
                    .disabled(!closeAllowed)
                    .padding()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(ad.previews[locale] ?? [], id: \.self) { previewImage in
                            Image(uiImage: UIImage(named: previewImage, in: .module, with: nil) ?? UIImage())
                                .resizable()
                                .frame(width: 210, height: 440)
                                .background(.ultraThinMaterial)
                                .cornerRadius(30)
                                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 5)
                                .padding(.horizontal, 5)
                        }
                    }
                    .padding()
                }
                
                Text(ad.description[locale] ?? "")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Button {
                    openAppStore()
                } label: {
                    HStack {
                        Spacer()
                        Text(localizedButtons["download_btn"]?[locale] ?? "Get App")
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.accentColor)
                    .cornerRadius(15)
                    .padding()
                }
                
                HStack {
                    Link("GitHub", destination: githubURL)
                    Spacer()
                    Link("LinkedIn", destination: linkedinURL)
                    Spacer()
                    Link("TikTok", destination: tiktokURL)
                }
                .padding(.top, 20)
                .padding()
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
    
    func closeAd() {
        print("DISMISS -1")
//        presentationMode.wrappedValue.dismiss()
        onClose()
    }
}
