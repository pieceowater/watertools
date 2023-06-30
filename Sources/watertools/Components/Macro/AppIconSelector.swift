//
//  AppIconSelector.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

public struct AppIconSelector: View {
    private let appIcons: [String] = [
        "Goalmap",
        "Rocket",
        "Unicorn",
        "Palm"
    ]
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(appIcons, id: \.self){ icon in
                    Button {
                        changeAppIcon(icon)
                    } label: {
                        VStack{
                            Image(icon)
                                .resizable()
                                .frame(width: 65, height: 65)
                                .cornerRadius(10)
                            Text(icon)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
        }
    }
    
    private func changeAppIcon(_ icon: String) {
        let selectedAppIcon = icon + "AppIcon"
        print(selectedAppIcon)
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        
        UIApplication.shared.setAlternateIconName(selectedAppIcon) { error in
            if let error = error {
                print("Error changing app icon: \(error.localizedDescription)")
            }
        }
    }
}
