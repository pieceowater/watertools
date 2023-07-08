//
//  GoogleAdManager.swift
//
//
//  Created by yury mid on 01.07.2023.
//

import Foundation

public func getAdID(_ plistKey: String) -> String {
    guard let plistURL = Bundle.main.url(forResource: "Ads", withExtension: "plist"),
          let plistData = try? Data(contentsOf: plistURL),
          let plistDictionary = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
          let adUnitID = plistDictionary[plistKey] as? String
    else {
        return ""
    }
    return adUnitID
}

