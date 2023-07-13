//
//  UpgradeApp.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI
import StoreKit

public struct UpgradeApp: View {
//    public struct Offer {
//        let productID: String
//        let productName: String
//        let productPrice: String
//        let productDescription: String
//        let productIcon: Image?
//
//
//        public init(productID: String, productName: String, productPrice: String, productDescription: String, productIcon: Image? = nil) {
//            self.productID = productID
//            self.productName = productName
//            self.productPrice = productPrice
//            self.productDescription = productDescription
//            self.productIcon = productIcon
//        }
//    }
    
    public var products: [Product]
    
    let navigationTitle: String
    let navResetBtn: String
    let resetAction: () -> Void
    let btnTextPrefix: String
    let purchaseAction: (Product) -> Bool
    
    public init(products: [Product], navigationTitle: String = "Upgrade to Pro", navResetBtn: String = "Restore", resetAction: @escaping () -> Void, btnTextPrefix: String = "Get for", purchaseAction: @escaping (Product) -> Bool) {
        self.products = products
        self.navigationTitle = navigationTitle
        self.navResetBtn = navResetBtn
        self.resetAction = resetAction
        self.btnTextPrefix = btnTextPrefix
        self.purchaseAction = purchaseAction
    }
    
    public var body: some View {
        ScrollView {
            ForEach(products){ product in
                OfferCard(offer: product, btnTextPrefix: btnTextPrefix, purchaseAction: purchaseAction)
            }
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavToolbarBtnItem(title: navResetBtn, icon: "arrow.uturn.left.circle") {
                    resetAction()
                }
            })
        }
        
    }
    
    public struct OfferCard: View {
        public var offer: Product
        
        let btnTextPrefix: String
        let purchaseAction: (Product) -> Bool
        public init(offer: Product, btnTextPrefix: String, purchaseAction: @escaping (Product) -> Bool) {
            self.offer = offer
            self.btnTextPrefix = btnTextPrefix
            self.purchaseAction = purchaseAction
        }
                
        public var body: some View {
            VStack{
                
                if let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
                   let primaryIconDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
                   let iconFiles = primaryIconDictionary["CFBundleIconFiles"] as? [String],
                   let lastIconFile = iconFiles.last {
                    if let appIcon = UIImage(named: lastIconFile) {
                        appIcon
//                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    } else {
                        print("Failed to retrieve app icon")
                    }
                } else {
                    print("Failed to retrieve app icon information")
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
            .padding()
        }
    }
}
