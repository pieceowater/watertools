//
//  UpgradeApp.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI
import StoreKit

public struct UpgradeApp: View {
    public var products: [Product]
    
    let eulaUrl: URL
    let privacyUrl: URL
    let navRestoreBtn: String
    let restoreAction: () -> Void
    let btnTextPrefix: String
    let purchaseAction: (Product) -> Void
    
    public init(products: [Product], eulaUrl: URL, privacyUrl: URL,  navRestoreBtn: String = "Restore", restoreAction: @escaping () -> Void, btnTextPrefix: String = "Get for", purchaseAction: @escaping (Product) -> Void) {
        self.products = products
        self.navRestoreBtn = navRestoreBtn
        self.restoreAction = restoreAction
        self.btnTextPrefix = btnTextPrefix
        self.purchaseAction = purchaseAction
    }
    
    public var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                ForEach(products){ product in
                    OfferCard(offer: product, btnTextPrefix: btnTextPrefix, purchaseAction: purchaseAction)
                }
                
                watertools.ExternalLinkBtn(title: "Terms of Use (EULA)", url: eulaUrl)
                watertools.ExternalLinkBtn(title: "Privacy policy", url: privacyUrl)
            }.padding()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavToolbarBtnItem(title: navRestoreBtn, icon: "arrow.uturn.left.circle") {
                    restoreAction()
                }
            })
        }
        
    }
    
    public struct OfferCard: View {
        struct AppIconView: UIViewRepresentable {
            let appIcon: UIImage
            
            func makeUIView(context: Context) -> UIImageView {
                let imageView = UIImageView(image: appIcon)
                imageView.contentMode = .scaleAspectFit
                return imageView
            }
            
            func updateUIView(_ uiView: UIImageView, context: Context) {
                uiView.image = appIcon
            }
        }
        
        public var offer: Product
        
        let btnTextPrefix: String
        let purchaseAction: (Product) -> Void
        public init(offer: Product, btnTextPrefix: String, purchaseAction: @escaping (Product) -> Void) {
            self.offer = offer
            self.btnTextPrefix = btnTextPrefix
            self.purchaseAction = purchaseAction
        }
                
        public var body: some View {
            VStack{
                
                if let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
                   let primaryIconDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
                   let iconFiles = primaryIconDictionary["CFBundleIconFiles"] as? [String],
                   let lastIconFile = iconFiles.last,
                   let appIcon = UIImage(named: lastIconFile) {
                    AppIconView(appIcon: appIcon)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                } else {
                    Text("Failed to retrieve app icon")
                }

                Text(offer.displayName)
                    .font(.title)
                    .fontWeight(.bold)
                Text(offer.description)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Button {
                    purchaseAction(offer)
                } label: {
                    HStack{
                        Spacer()
                        Text("\(btnTextPrefix) \(offer.displayPrice)")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
    }
}

