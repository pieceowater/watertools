//
//  LanguagePicker.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

@available(iOS 16, *)
public struct LanguagePicker: View {
    
    public struct Language {
        let icon: String
        let name: String
        let code: String
    }
    
    public let languages: [Language]
    
    public let locale = Locale.current.language.languageCode?.identifier
    
    public init(languages: [Language]) {
        self.languages = languages
    }
    
    public var body: some View {
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
