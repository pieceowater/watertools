//
//  AppLovinInterstitial.swift
//  
//
//  Created by yury mid on 30.07.2023.
//
// docs: https://dash.applovin.com/documentation/mediation/ios/ad-formats/interstitials

// AppLovinInterstitial.swift

import Foundation
import AppLovinSDK
import Combine

public class AppLovinInterstitial: NSObject, MAAdDelegate, ObservableObject {
    @Published public var isAdReady: Bool = false
    private var interstitialAd: MAInterstitialAd?
    private var adUnitID: String
    
    public init(_ interstitialAdName: String) {
        self.adUnitID = getAdID(interstitialAdName)
        super.init()
        setupInterstitial()
    }
    
    private func setupInterstitial() {
        interstitialAd = MAInterstitialAd(adUnitIdentifier: adUnitID)
        interstitialAd?.delegate = self
        interstitialAd?.load()
    }
    
    public func showInterstitial() {
        if let interstitial = interstitialAd, interstitial.isReady {
            interstitial.show()
        } else {
            print("Interstitial ad is not ready to be shown yet.")
            // You can handle this case according to your needs, for example, by displaying a message to the user or trying to reload the ad again.
        }
    }
    
    // MARK: MAAdDelegate Protocol
    
    public func didLoad(_ ad: MAAd) {
        isAdReady = true
    }
    
    public func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        // Interstitial ad failed to load, you may want to handle this failure.
        print("Interstitial ad failed to load: \(error.localizedDescription)")
    }
    
    public func didDisplay(_ ad: MAAd) {}
    
    public func didClick(_ ad: MAAd) {}
    
    public func didHide(_ ad: MAAd) {
        // Interstitial ad is hidden. Pre-load the next ad
        interstitialAd?.load()
    }
    
    public func didFail(toDisplay ad: MAAd, withError error: MAError) {
        // Interstitial ad failed to display. We recommend loading the next ad
        interstitialAd?.load()
    }
}
