//
//  AdMobInterstitial.swift
//  
//
//  Created by yury mid on 08.07.2023.
//

import SwiftUI
import GoogleMobileAds
import UIKit
    
//public class Interstitial:NSObject{
//    var interstitial: GADInterstitialAd?
//
//    override init() {
//        super.init()
//        LoadInterstitial()
//    }
//
//    func LoadInterstitial(){
//        let req = GADRequest()
//        self.interstitial.load()
//        self.interstitial.delegate = self
//    }
//
//    func showAd(){
//        if self.interstitial.isReady{
//           let root = UIApplication.shared.windows.first?.rootViewController
//           self.interstitial.present(fromRootViewController: root!)
//        }
//       else{
//           print("Not Ready")
//       }
//    }
//
//    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
//        self.interstitial = GADInterstitial(adUnitID: watertools.getAdID("Interstitial"))
//        LoadInterstitial()
//    }
//}
//
//struct ContentView:View{
//    var interstitial:Interstitial
//
//    init(){
//        self.interstitial = Interstitial()
//    }
//
//    var body : some View{
//      Button(action: {self.interstitial.showAd()}){
//        Text("My Button")
//      }
//    }
//}

public final class AdMobInterstitial: NSObject, GADFullScreenContentDelegate {
    public var interstitialAd: GADInterstitialAd?
    public let interstitialAdID: String?

    public init(_ interstitialAdName: String) {
        self.interstitialAdID = getAdID(interstitialAdName)
        super.init()
    }

    public func LoadInterstitial() {
        guard let adUnitID = interstitialAdID else {
            print("Reward ad ID is nil")
            return
        }

        let request = GADRequest()

        GADInterstitialAd.load(withAdUnitID: adUnitID, request: request) { (ad, error) in
            if let error = error {
                print("Interstitial ad failed to load with error: \(error.localizedDescription)")
                return
            }

            self.interstitialAd = ad
            self.interstitialAd?.fullScreenContentDelegate = self
        }
    }

    public func showInterstitialAd(){
        LoadInterstitial()
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }

        let root = window.rootViewController
        if let ad = interstitialAd {
            ad.present(fromRootViewController: root!)
        } else {
            print("Ad wasn't ready")
        }
    }

//    public func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
//        if let rf = rewardFunction {
//            rf()
//        }
//    }
}
