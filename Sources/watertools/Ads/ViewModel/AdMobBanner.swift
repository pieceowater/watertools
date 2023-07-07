//
//  AdMobBannerVC.swift
//  
//
//  Created by yury mid on 08.07.2023.
//

import SwiftUI
import GoogleMobileAds
import UIKit

public struct AdMobBannerVC: UIViewControllerRepresentable {
    let bannerID: String
    
    public init(_ bannerID: String) {
        self.bannerID = bannerID
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: GADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = bannerID
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

public struct AdMobBanner: View {
    let bannerName: String
    
    public init(_ bannerName: String) {
        self.bannerName = bannerName
    }
    
    public var body: some View {
        HStack {
            Spacer()
            AdMobBannerVC(watertools.getAdID(bannerName))
            Spacer()
        }
    }
}
