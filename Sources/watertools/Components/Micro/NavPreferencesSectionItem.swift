//
//  NavPreferencesSectionItem.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct NavPreferencesSectionItem<Destination: View>: View {
    public let title: String
    public let icon: String?
    public let destination: Destination
    
    public var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon ?? "")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                Text(title)
                    .font(.headline)
            }
        }
    }
}
