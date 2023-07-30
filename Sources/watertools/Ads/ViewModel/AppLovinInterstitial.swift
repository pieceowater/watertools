//
//  AppLovinInterstitial.swift
//  
//
//  Created by yury mid on 30.07.2023.
//
// docs: https://dash.applovin.com/documentation/mediation/ios/ad-formats/interstitials

// AppLovinInterstitialViewController.swift

import Foundation
import UIKit
import AppLovinSDK

public class AppLovinInterstitial: UIViewController, MAAdDelegate {
    public var interstitialAd: MAInterstitialAd!
    var retryAttempt = 0.0
    public let interstitialAdID: String?
    
    public init(_ interstitialAdName: String) {
        self.interstitialAdID = getAdID(interstitialAdName)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func createInterstitialAd() {
        guard let adUnitID = interstitialAdID else {
            return
        }
        
        interstitialAd = MAInterstitialAd(adUnitIdentifier: adUnitID)
        interstitialAd.delegate = self
        
        // Load the first ad
        interstitialAd.load()
    }
    
    // MARK: MAAdDelegate Protocol
    
    public func didLoad(_ ad: MAAd) {
        // Interstitial ad is ready to be shown. 'interstitialAd.isReady' will now return 'true'
        
        // Reset retry attempt
        retryAttempt = 0
    }
    
    public func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        
        retryAttempt += 1
        let delaySec = pow(2.0, min(6.0, retryAttempt))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.interstitialAd.load()
        }
    }
    
    public func didDisplay(_ ad: MAAd) {}
    
    public func didClick(_ ad: MAAd) {}
    
    public func didHide(_ ad: MAAd) {
        // Interstitial ad is hidden. Pre-load the next ad
        interstitialAd.load()
    }
    
    public func didFail(toDisplay ad: MAAd, withError error: MAError) {
        // Interstitial ad failed to display. We recommend loading the next ad
        interstitialAd.load()
    }
}
