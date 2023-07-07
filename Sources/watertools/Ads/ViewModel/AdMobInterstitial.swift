//
//  AdMobInterstitial.swift
//  
//
//  Created by yury mid on 08.07.2023.
//

import SwiftUI
import GoogleMobileAds
import UIKit

public final class AdMobInterstitial: NSObject, GADFullScreenContentDelegate {
    public var interstitialAd: GADInterstitialAd?
    public let interstitialAdID: String?

    public init(_ interstitialAdName: String) {
        self.interstitialAdID = getAdID(interstitialAdName)
        super.init()
    }

    public func loadInterstitial(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let adUnitID = interstitialAdID else {
            completion(.failure(NSError(domain: "AdMobInterstitial", code: 0, userInfo: [NSLocalizedDescriptionKey: "Interstitial ad ID is nil"])))
            return
        }

        let request = GADRequest()

        GADInterstitialAd.load(withAdUnitID: adUnitID, request: request) { [weak self] (ad, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            self?.interstitialAd = ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            completion(.success(()))
        }
    }

    public func showInterstitialAd() -> Bool {
        return loadInterstitial { [weak self] result in
            switch result {
            case .success:
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first,
                      let root = window.rootViewController else {
                    return false
                }
                if let ad = self?.interstitialAd {
                    ad.present(fromRootViewController: root)
                    return true
                } else {
                    return false
                }
            case .failure(let error):
                print("Interstitial ad failed to load with error: \(error.localizedDescription)")
                return false
            }
        }
    }

}


