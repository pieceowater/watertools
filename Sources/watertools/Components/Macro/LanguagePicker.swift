//
//  LanguagePicker.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

@available(iOS 16, *)
struct LanguagePicker: View {
    
    struct Language {
        let icon: String
        let name: String
        let code: String
    }
    
    let languages = [
        Language(icon: "🇺🇸", name: "English", code: "en"),
        Language(icon: "🇷🇺", name: "Русский", code: "ru")
    ]
    
    let locale = Locale.current.language.languageCode?.identifier
    
    var body: some View {
        List(languages, id: \.name) { language in
            Button(action: {
                
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
        .navigationTitle("Language")
    }
    
    
}
