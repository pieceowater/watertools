//
//  AdMobReward.swift
//
//
//  Created by yury mid on 08.07.2023.
//

import SwiftUI
import GoogleMobileAds
import UIKit

public final class AdMobReward: NSObject, GADFullScreenContentDelegate {
    public var rewardedAd: GADRewardedAd?
    public var rewardFunction: (() -> Void)? = nil
    public let rewardAdID: String?

    public init(_ rewardAdName: String) {
        self.rewardAdID = getAdID(rewardAdName)
        super.init()
    }

    public func LoadRewarded(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let adUnitID = rewardAdID else {
            completion(.failure(NSError(domain: "AdMobRewarded", code: 0, userInfo: [NSLocalizedDescriptionKey: "Rewarded ad ID is nil"])))
            return
        }

        let request = GADRequest()

        GADRewardedAd.load(withAdUnitID: adUnitID, request: request) { [weak self] (ad, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            self?.rewardedAd = ad
            self?.rewardedAd?.fullScreenContentDelegate = self
            completion(.success(()))
        }
    }

    public func showRewardedAd(rewardFunction: @escaping (_ reward: GADAdReward) -> Void){
        LoadRewarded { [weak self] result in
            switch result {
            case .success:
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first,
                      let root = window.rootViewController else {
                    completion(false)
                    return
                }
                if let ad = self?.rewardedAd {
                    ad.present(fromRootViewController: root,
                               userDidEarnRewardHandler: {
                                    let reward = ad.adReward
                                    rewardFunction(reward)
                                }
                               )
                    completion(true)
                } else {
                    completion(false)
                }
            case .failure(let error):
                print("Rewarded ad failed to load with error: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    public func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        if let rf = rewardFunction {
            rf()
        }
    }

//    private func showOfflineAd() {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let window = windowScene.windows.first else {
//            return
//        }
//
//        let hostingController = UIHostingController(rootView: offlineAdView)
//        hostingController.view.frame = window.bounds
//        window.addSubview(hostingController.view)
//        window.rootViewController?.addChild(hostingController)
//        hostingController.didMove(toParent: window.rootViewController)
//    }
}


