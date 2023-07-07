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
    private var offlineAdController: UIHostingController<OfflineAdBanner>?

    public lazy var offlineAdView: OfflineAdBanner = {
        OfflineAdBanner(currentAppId: 2, onClose: { [weak self] in
            self?.dismissOfflineAd()
            print("DISMISS 1")
        })
    }()

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

    public func showInterstitialAd() {
        loadInterstitial { [weak self] result in
            switch result {
            case .success:
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first,
                      let root = window.rootViewController else {
                    return
                }
                if let ad = self?.interstitialAd {
                    ad.present(fromRootViewController: root)
                } else {
                    self?.showOfflineAd()
                }
            case .failure(let error):
                print("Interstitial ad failed to load with error: \(error.localizedDescription)")
                self?.showOfflineAd()
            }
        }
    }

    private func showOfflineAd() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }

        offlineAdController = UIHostingController(rootView: offlineAdView)
        offlineAdController?.view.frame = window.bounds
        window.addSubview(offlineAdController!.view)
        window.rootViewController?.addChild(offlineAdController!)
        offlineAdController?.didMove(toParent: window.rootViewController)
    }

    public func dismissOfflineAd() {
        print("DISMISS 2")
        offlineAdController?.willMove(toParent: nil)
        offlineAdController?.view.removeFromSuperview()
        offlineAdController?.removeFromParent()
        offlineAdController = nil
    }
}
