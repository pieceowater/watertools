//
//  PrimaryButton.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

public struct PrimaryButton: View {
    var action: () -> Void = { print("Warning: PrimaryButton Action is empty!") }
    var text: String = "OK"
    
    public init(_ text: String, action: @escaping () -> Void){
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
}
