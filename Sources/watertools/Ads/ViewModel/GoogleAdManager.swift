//
//  GoogleAdManager.swift
//
//
//  Created by yury mid on 01.07.2023.
//

import Foundation
import GoogleMobileAds
import UIKit

public final class GoogleAdManager: NSObject, GADFullScreenContentDelegate {
    public var rewardedAd: GADRewardedAd?
    public var rewardFunction: (() -> Void)? = nil
    public let rewardAdID: String?

    public init(rewardAdID: String? = nil) {
        self.rewardAdID = rewardAdID
        super.init()
    }

    public func LoadRewarded() {
        guard let adUnitID = rewardAdID else {
            print("Reward ad ID is nil")
            return
        }
        
        let request = GADRequest()
        
        GADRewardedAd.load(withAdUnitID: adUnitID, request: request) { (ad, error) in
            if let error = error {
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                return
            }
            
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
        }
    }

    public func showRewardedAd(rewardFunction: @escaping (_ reward: GADAdReward) -> Void){
        LoadRewarded()
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }

        let root = window.rootViewController
        if let ad = rewardedAd {
            ad.present(fromRootViewController: root!,
                       userDidEarnRewardHandler: {
                            let reward = ad.adReward
                            rewardFunction(reward)
                       }
            )
        } else {
            print("Ad wasn't ready")
        }
    }

    public func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        if let rf = rewardFunction {
            rf()
        }
    }
}