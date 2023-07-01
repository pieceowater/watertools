//
//  SystemPreferencesManager.swift
//  
//
//  Created by yury mid on 01.07.2023.
//

import Foundation

public class SystemPreferencesManager: ObservableObject {
    public static let shared = UserSettingsManager()
    
    @Published var accentColor: Colors = .default
    @Published var theme: Theme = .light
    @Published var selectedLanguage: Language?
    
    private init() {
        loadSettings()
    }
    
    func saveSettings() {
        UserDefaults.standard.set(accentColor.rawValue, forKey: "accentColor")
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
    }
    
    func setLanguage(_ language: Language) {
        selectedLanguage = language
        
        UserDefaults.standard.set([language.code], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    private func loadSettings() {
        if let accentColorValue = UserDefaults.standard.string(forKey: "accentColor"),
           let accentColor = Colors(rawValue: accentColorValue) {
            self.accentColor = accentColor
        }
        
        if let themeValue = UserDefaults.standard.string(forKey: "theme"),
           let theme = Theme(rawValue: themeValue) {
            self.theme = theme
        }
    }
    
    func resetSettings() {
        UserDefaults.standard.removeObject(forKey: "accentColor")
        UserDefaults.standard.removeObject(forKey: "theme")
        loadSettings()
    }
}
