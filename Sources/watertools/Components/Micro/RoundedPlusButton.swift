//
//  RoundedPlusButton.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct RoundedPlusButton: View {
    public let radius: Int = 100
    public let action: () -> Void
    
    public var body: some View {
        Button(action:{
            action()
        }) {
            Image(systemName: "plus")
                .font(.largeTitle)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(100)
        }
    }
}
