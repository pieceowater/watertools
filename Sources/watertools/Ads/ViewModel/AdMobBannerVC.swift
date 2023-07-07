//
//  AdMobBannerVC.swift
//  
//
//  Created by yury mid on 08.07.2023.
//

import SwiftUI
import GoogleMobileAds
import UIKit

final private class BannerVC: UIViewControllerRepresentable  {
    let bannerID: String
    
    init(_ bannerID: String) {
        self.bannerID = bannerID
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: GADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = bannerID
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

public struct Banner:View{
    let bannerID: String
    
    public init(_ bannerID: String) {
        self.bannerID = bannerID
    }
    
    public var body: some View{
        HStack{
            Spacer()
            BannerVC(bannerID).frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}
