//
//  LanguagePicker.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

@available(iOS 16, *)
public struct LanguagePicker: View {
    @EnvironmentObject var systemPreferencesManager: SystemPreferencesManager
    @State private var showAlert = false
    
    public struct Language {
        let icon: String
        let name: String
        let code: String
        
        public init(icon: String, name: String, code: String) {
            self.icon = icon
            self.name = name
            self.code = code
        }
    }
    
    public let languages: [Language]
    public let navigationTitle: String
    
    public let locale = Locale.current.language.languageCode?.identifier
    
    public init(languages: [Language], navigationTitle: String = "Language") {
        self.languages = languages
        self.navigationTitle = navigationTitle
    }
    
    public var body: some View {
        List(languages, id: \.name) { language in
            Button(action: {
                systemPreferencesManager.setLanguage(language)
            }) {
                HStack {
                    Text(language.icon)
                        .padding(5)
                    Text(language.name)
                        .fontWeight(locale == language.code ? .bold : .regular)
                        .foregroundColor(locale == language.code ? .accentColor : .primary)
                }
            }
        }
        .navigationTitle(navigationTitle)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Restart Required"),
                message: Text("Please restart the app to apply the changes!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    
    
}

struct Local {
    static func str(_ key: String) -> LocalizedStringKey {
        return LocalizedStringKey(key)
    }
}
