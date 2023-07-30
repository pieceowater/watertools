//
//  File.swift
//  
//
//  Created by yury mid on 30.07.2023.
//  Created by yury mid on 29.07.2023.
//
// docs: https://dash.applovin.com/documentation/mediation/ios/ad-formats/swiftui#banners

import AppLovinSDK
import SwiftUI

public struct AppLovinWrapper: UIViewRepresentable {
    
    let bannerID: String
        
    public init(_ bannerID: String) {
        self.bannerID = bannerID
    }
    
    public func makeUIView(context: Context) -> MAAdView {
        let adView = MAAdView(adUnitIdentifier: bannerID)
        adView.delegate = context.coordinator

        adView.backgroundColor = .systemBackground

        adView.loadAd()

        return adView
    }

    public func updateUIView(_ uiView: MAAdView, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

public extension AppLovinWrapper {
    public class Coordinator: NSObject, MAAdViewAdDelegate {
        // MARK: MAAdDelegate Protocol

        public func didLoad(_ ad: MAAd) {}

        public func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {}

        public func didClick(_ ad: MAAd) {}

        public func didFail(toDisplay ad: MAAd, withError error: MAError) {}

        // MARK: MAAdViewAdDelegate Protocol

        public func didExpand(_ ad: MAAd) {}

        public func didCollapse(_ ad: MAAd) {}

        // MARK: Deprecated Callbacks

        public func didDisplay(_ ad: MAAd) { /* use this for impression tracking */ }
        public func didHide(_ ad: MAAd) { /* DO NOT USE - THIS IS RESERVED FOR FULLSCREEN ADS ONLY AND WILL BE REMOVED IN A FUTURE SDK RELEASE */ }
    }
}

// SwiftUI view to show ad
public struct AppLovinBannerAdView: View {
    
    let bannerName: String
    
    public init(_ bannerName: String) {
        self.bannerName = bannerName
    }
    
    // Banner height on iPhone and iPad is 50 and 90, respectively
    let height: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 50

    // Stretch to the width of the screen for banners to be fully functional
//    let width: CGFloat = UIScreen.main.bounds.width

    public var body: some View {
        AppLovinWrapper(watertools.getAdID(bannerName))
            .frame(height: height)
            
    }
}
