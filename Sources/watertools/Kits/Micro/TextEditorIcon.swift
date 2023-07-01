//
//  TextEditorIcon.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

public struct TextEditorIcon: View {
    @Binding var text: String
    let placeholder: String
    let icon: Image?
    @FocusState private var isFocused: Bool
    
    public init(_ text: Binding<String>, placeholder: String = "", icon: Image? = nil) {
        self._text = text
        self.placeholder = placeholder
        self.icon = icon
    }
    
    public var body: some View {
        HStack(alignment: .top){
            if let icon = icon {
                icon
                    .foregroundColor(.accentColor)
                    .padding(.top, 8)
                Divider()
            }
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .focused($isFocused)
                    .frame(height: 100)
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 5)
                        .onTapGesture {
                            isFocused = true
                        }
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.accentColor, lineWidth: 1)
        )
    }
}
