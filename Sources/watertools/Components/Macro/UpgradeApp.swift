//
//  UpgradeApp.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

struct UpgradeAppView: View {
    struct Offer {
        let productID: String
        let productName: String
        let productPrice: String
        let productDescription: String
        let productIcon: Image
    }
    
    let products: [Offer] = [
        Offer(productID: "goalmappro", productName: "Goalmap Pro", productPrice: "$9.99", productDescription: "Full unlimited access to all app features and no ads!", productIcon: Image("GoalmapLogo"))
    ]
    
    var body: some View {
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
    
    struct OfferCard: View {
        var offer: Offer
        
        var body: some View {
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
