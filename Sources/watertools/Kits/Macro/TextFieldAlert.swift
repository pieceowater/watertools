//
//  TextFieldAlert.swift
//  
//
//  Created by yury mid on 12.07.2023.
//

import SwiftUI

public extension View {
    func textFieldAlert(isPresented: Binding<Bool>, text: Binding<String>, headingText: String, subheadingText: String? = nil, textFieldPlaceholder: String? = nil, textFieldIcon: Image? = nil, cancelCaption: String, submitCaption: String, cancelAction: (() -> Void)? = nil, submitAction: @escaping () -> Void) -> some View {
        modifier(TextFieldAlert(isPresented: isPresented,
                                text: text,
                                headingText: headingText,
                                subheadingText: subheadingText,
                                textFieldPlaceholder: textFieldPlaceholder,
                                textFieldIcon: textFieldIcon,
                                cancelCaption: cancelCaption,
                                submitCaption: submitCaption,
                                cancelAction: cancelAction,
                                submitAction: submitAction
                               )
        )
    }
}

public struct TextFieldAlert: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var text: String
    
    let headingText: String
    let subheadingText: String?
    let textFieldPlaceholder: String?
    let textFieldIcon: Image?
    let cancelCaption: String
    let submitCaption: String
    
    let cancelAction: (() -> Void)?
    let submitAction: () -> Void
    
    public init(isPresented: Binding<Bool>, text: Binding<String>, headingText: String, subheadingText: String? = nil, textFieldPlaceholder: String? = nil, textFieldIcon: Image? = nil, cancelCaption: String, submitCaption: String, cancelAction: (() -> Void)? = nil, submitAction: @escaping () -> Void) {
        self._isPresented = isPresented
        self._text = text
        self.headingText = headingText
        self.subheadingText = subheadingText
        self.textFieldPlaceholder = textFieldPlaceholder
        self.textFieldIcon = textFieldIcon
        self.cancelCaption = cancelCaption
        self.submitCaption = submitCaption
        self.cancelAction = cancelAction
        self.submitAction = submitAction
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isPresented {
                        ZStack {
                            Color(UIColor.black)
                                .opacity(0.3)
                                .edgesIgnoringSafeArea(.all)
                            
                            VStack(spacing: 10) {
                                Text(headingText)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .padding(.top)
                                
                                if let subheadingText = subheadingText {
                                    Text(subheadingText)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                }
                                
                                watertools.TextFieldIcon($text, placeholder: textFieldPlaceholder ?? "", icon: textFieldIcon)
                                    .frame(height: 35)
                                    .padding(.vertical)
                                
                                HStack {
                                    watertools.SecondaryButton(cancelCaption) {
                                        withAnimation {
                                            isPresented = false
                                            if let cancelAction {
                                                cancelAction()
                                            }
                                        }
                                    }.foregroundColor(.primary)
                                    Spacer()
                                    watertools.SecondaryButton(submitCaption) {
                                        withAnimation {
                                            isPresented = false
                                            submitAction()
                                        }
                                    }.font(.headline)
                                    .disabled(text.isEmpty)
                                }
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground).opacity(0.99))
                            .cornerRadius(10)
                            .padding(40)
                        }
                    }
                }
            )
    }
}
