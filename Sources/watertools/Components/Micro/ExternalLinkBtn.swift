//
//  ExternalLinkBtn.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

struct ExternalLinkBtn: View {
    let title: String
    let url: URL
    var body: some View {
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
