//
//  PlaceholderView.swift
//  
//
//  Created by yury mid on 11.07.2023.
//

import SwiftUI

public struct PlaceholderView: View {
    let icon: Image
    let heading: String
    let subheading: String?
    let buttonText: String?
    let buttonAction: (() -> Void)?
    
    public init(icon: Image, heading: String, subheading: String? = nil, buttonText: String? = nil, buttonAction: (() -> Void)? = nil) {
        self.icon = icon
        self.heading = heading
        self.subheading = subheading
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        VStack{
            icon
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom)
            VStack{
                Text(heading)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                if let subheading = subheading {
                    Text(subheading)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.bottom)
            
            if let buttonText = buttonText,
               let buttonAction = buttonAction {
                Button {
                    buttonAction()
                } label: {
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
    }
}
