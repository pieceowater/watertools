//
//  TextFieldIcon.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

public struct TextFieldIcon: View {
    @Binding var text: String
    let placeholder: String
    let icon: Image?
    
    public init(_ text: Binding<String>, placeholder: String = "", icon: Image? = nil) {
        self._text = text
        self.placeholder = placeholder
        self.icon = icon
    }
    
    public var body: some View {
        HStack {
            if let icon = icon {
                icon
                    .foregroundColor(.accentColor)
                Divider()
            }
            TextField(placeholder, text: $text)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}
