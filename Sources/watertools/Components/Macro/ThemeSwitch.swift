//
//  ThemeSwitch.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

struct ThemeSwitch: View {
    enum Theme: String {
        case light
        case dark
    }
    
    @State var theme: Theme = ThemeSwitch.Theme(rawValue: UserDefaults.standard.string(forKey: "theme") ?? "light") ?? .light
    
    var body: some View {
        HStack {
            Text("Light Mode")
                .foregroundColor(.primary)
            ZStack {
                HStack {
                    Spacer()
                    Image(systemName: "sun.max.fill")
                        .padding(.trailing, 6)
                        .opacity(theme == .light ? 1 : 0)
                    Toggle("", isOn: .init(get: { theme == .dark }, set: { newValue in
                        theme = newValue ? .dark : .light
                        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
                    }))
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    .labelsHidden()
                    Image(systemName: "moon.fill")
                        .padding(.leading, 6)
                        .opacity(theme == .dark ? 1 : 0)
                    Spacer()
                }.padding(.vertical, 5)
            }
            Text("Dark Mode")
                .foregroundColor(.primary)
        }
    }
}
