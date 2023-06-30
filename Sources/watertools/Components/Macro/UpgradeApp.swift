//
//  UpgradeApp.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct UpgradeApp: View {
    public struct Offer {
        let productID: String
        let productName: String
        let productPrice: String
        let productDescription: String
        let productIcon: Image
        
        
        public init(productID: String, productName: String, productPrice: String, productDescription: String, productIcon: Image) {
            self.productID = productID
            self.productName = productName
            self.productPrice = productPrice
            self.productDescription = productDescription
            self.productIcon = productIcon
        }
    }
    
    public var products: [Offer] = []
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            ForEach(products, id: \.productID){ product in
                OfferCard(offer: product)
            }
        }
        .navigationTitle("Upgrade to Pro")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavToolbarBtnItem(title: "Restore", icon: "arrow.uturn.left.circle") {
                }
            })
        }
        
    }
    
    public struct OfferCard: View {
        public var offer: Offer
        
        public var body: some View {
            VStack{
                offer.productIcon
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text(offer.productName)
                    .font(.title)
                    .fontWeight(.bold)
                Text(offer.productDescription)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Button {
                    // buy here
                } label: {
                    HStack{
                        Spacer()
                        Text("Get for \(offer.productPrice)")
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
