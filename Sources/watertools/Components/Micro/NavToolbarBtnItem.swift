//
//  NavToolbarBtnItem.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct NavToolbarBtnItem: View {
    public let title: String
    public let icon: String?
    public let action: () -> Void
    
    public init(title: String, icon: String?, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    
    public var body: some View {
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
