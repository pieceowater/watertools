//
//  RoundedPlusButton.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

struct RoundedPlusButton: View {
    let radius: Int = 100
    let action: () -> Void
    
    var body: some View {
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
