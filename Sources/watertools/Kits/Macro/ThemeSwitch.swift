//
//  ThemeSwitch.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

@available(iOS 16, *)
public struct ThemeSwitch: View {
    @EnvironmentObject var systemPreferencesManager: SystemPreferencesManager
    public enum Theme: String {
        case light
        case dark
    }
    
    let lightModeText: String
    let darkModeText: String
    
    public init(lightModeText: String = "Light Mode", darkModeText: String = "Dark Mode") {
        self.lightModeText = lightModeText
        self.darkModeText = darkModeText
    }
    
    public var body: some View {
        HStack {
            Text(lightModeText)
                .foregroundColor(.primary)
            ZStack {
                HStack {
                    Spacer()
                    Image(systemName: "sun.max.fill")
                        .padding(.trailing, 6)
                        .opacity(systemPreferencesManager.theme == .light ? 1 : 0)
                    Toggle("", isOn: .init(get: { systemPreferencesManager.theme == .dark }, set: { newValue in
                        systemPreferencesManager.theme = newValue ? .dark : .light
                        systemPreferencesManager.saveSettings()
                    }))
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    .labelsHidden()
                    Image(systemName: "moon.fill")
                        .padding(.leading, 6)
                        .opacity(systemPreferencesManager.theme == .dark ? 1 : 0)
                    Spacer()
                }.padding(.vertical, 5)
            }
            Text(darkModeText)
                .foregroundColor(.primary)
        }
        .onAppear{
//            theme = systemPreferencesManager.theme
        }
    }
}
