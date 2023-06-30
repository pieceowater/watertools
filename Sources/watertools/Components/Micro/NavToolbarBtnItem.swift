//
//  NavToolbarBtnItem.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

struct NavToolbarBtnItem: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                Image(systemName: icon ?? "")
                    .font(.caption2)
                Text(title)
            }
        }
    }
}
