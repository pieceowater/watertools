//
//  ExternalLinkBtn.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct ExternalLinkBtn: View {
    public let title: String
    public let url: URL
    
    public init(title: String, url: URL) {
        self.title = title
        self.url = url
    }
    
    public var body: some View {
        Button(action: {
            UIApplication.shared.open(url)
        }) {
            HStack(spacing: 1) {
                Text(title)
                Image(systemName: "arrow.up.forward.app")
                    .font(.caption2)
            }
            .foregroundColor(.secondary)
            .font(.caption)
        }
    }
}
