//
//  IconPickerSheet.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

public struct IconPickerSheet: View {
    @State var selectedIcon: String
    var submitBtnText: String = "OK"
    var submitAction: (String) -> Void = {_ in }
    @Environment(\.presentationMode) var presentationMode
    
    public init(_ selectedIcon: String, submitBtnText: String = "OK", submitAction: @escaping (String) -> Void) {
        self._selectedIcon = State(initialValue: selectedIcon)
        self.submitBtnText = submitBtnText
        self.submitAction = submitAction
    }
    
    public var body: some View {
        VStack{
            Rectangle()
                .frame(width: 100, height: 5)
                .foregroundColor(Color.gray)
                .cornerRadius(5)
                .padding(.top, 15)
                .padding(.bottom, 10)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(Icons.allCases, id: \.self) { icon in
                        Button(action: {
                            selectedIcon = icon.rawValue
                        }) {
                            Image(icon.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding(8)
                                .background(selectedIcon == icon.rawValue ? Color.accentColor.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            
            watertools.PrimaryButton(submitBtnText) {
                submitAction(selectedIcon)
                presentationMode.wrappedValue.dismiss()
            }.padding(.horizontal)

        }
    }
    
}
