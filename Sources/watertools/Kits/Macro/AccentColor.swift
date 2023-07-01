//
//  AccentColor.swift
//  
//
//  Created by yury mid on 30.06.2023.
//

import SwiftUI

@available(iOS 16.0, *)
public struct AccentColor: View {
    @EnvironmentObject var systemPreferencesManager: SystemPreferencesManager
    @Environment(\.presentationMode) var presentationMode
    public let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State public var selectedColor: watertools.Colors
    let navigationTitle: String
    let previewContentTitle: String
    let previewContentCaption: String
    let previewContentBody: String
    let previewContentBackBtn: String
    let navResetBtn: String

    public init(navigationTitle: String = "Accent Color", previewContentTitle: String = "Preview of content", previewContentCaption: String = "Caption", previewContentBody: String = "Hit this button below and you'll return to the previous screen", previewContentBackBtn: String = "Go back", navResetBtn: String = "Reset") {
        self.navigationTitle = navigationTitle
        self.previewContentTitle = previewContentTitle
        self.previewContentCaption = previewContentCaption
        self.previewContentBody = previewContentBody
        self.previewContentBackBtn = previewContentBackBtn
        self.navResetBtn = navResetBtn
        _selectedColor = State(initialValue: watertools.Colors.default)
    }
    
    public var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(watertools.Colors.allCases, id: \.self) { color in
                    Button(action: {
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let windows = windowScene.windows.first {
                            windows.tintColor = UIColor(color.color)
                        }
                        selectedColor = color
                        systemPreferencesManager.accentColor = color
                        systemPreferencesManager.saveSettings()
                    }) {
                        Circle()
                            .fill(color.color)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle()
                                    .stroke(selectedColor == color ? .primary : Color.clear, lineWidth: 2)
                            )
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                Text(previewContentTitle)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Text(previewContentCaption)
                    .font(.subheadline)
                Text(previewContentBody)
                    .font(.caption)
                    .padding(.bottom, 15)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Spacer()
                        Text(previewContentBackBtn)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding()
            
        }
        .onAppear{
            selectedColor = systemPreferencesManager.accentColor
        }
        .navigationTitle(navigationTitle)
        .toolbar {
            if selectedColor != .default {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavToolbarBtnItem(title: navResetBtn, icon: "arrow.uturn.left.circle") {
                        selectedColor = .default
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let windows = windowScene.windows.first {
                            windows.tintColor = UIColor(selectedColor.color)
                        }
                    }
                })
            }
        }
    }
}

public enum Colors: String, CaseIterable {
    case `default`
    case blue
    case red
    case orange
    case purple
    case pink
    case teal
    case yellow
    case green
    case gray
    case cyan
    case brown
    case emerald
    case slate
    case coral
    case skyBlue
    
    public var color: Color {
        switch self {
        case .blue:
            return .blue
        case .red:
            return .red
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .pink:
            return .pink
        case .teal:
            return .teal
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .gray:
            return .gray
        case .cyan:
            return .cyan
        case .brown:
            return .brown
        case .emerald:
            return Color(hex: "50C878")
        case .slate:
            return Color(hex: "708090")
        case .coral:
            return Color(hex: "FF7F50")
        case .skyBlue:
            return Color(hex: "87CEEB")
        default:
            return Color(hex: "61C554")
        }
    }
}
public extension Color {
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            self.init(.gray)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
