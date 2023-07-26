//
//  Checkbox.swift
//  
//
//  Created by yury mid on 26.07.2023.
//

import Foundation
import SwiftUI

public struct Checkbox: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            withAnimation {
                configuration.isOn.toggle()
            }
        }) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? Color.accentColor : Color.gray.opacity(0.5))
                .overlay(configuration.isOn ? Image(systemName: "checkmark").foregroundColor(.white) : nil)
        }
    }
}

/*
 
 Toggle("", isOn: $isChecked)
     .labelsHidden()
     .toggleStyle(watertools.Checkbox())
     .padding(5)
 
 */
