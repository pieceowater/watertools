//
//  ToolsManager.swift
//  
//
//  Created by yury mid on 26.06.2023.
//

import Foundation

class Tool {
    static let fn = Tool()
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    func formatCurrency(_ amount: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        return formatter.string(from: NSNumber(value: amount))
    }

    func formatDateMin(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: date )
    }

    func formatCurrencyMin(_ amount: Double) -> String? {
        let number = NSNumber(value: amount)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        
        if amount >= 1_000_000 {
            let millionsValue = amount / 1_000_000
            return (formatter.string(from: NSNumber(value: millionsValue))?.replacingOccurrences(of: ".0", with: "") ?? "") + "M"
        } else if amount >= 1_000 {
            let thousandsValue = amount / 1_000
            return (formatter.string(from: NSNumber(value: thousandsValue))?.replacingOccurrences(of: ".0", with: "") ?? "") + "K"
        } else {
            return formatter.string(from: number)
        }
    }

    func parseNumber(_ numberString: String) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        
        let cleanedString = numberString
                .replacingOccurrences(of: "[^0-9.,]", with: "", options: .regularExpression)
                .replacingOccurrences(of: ",", with: ".")
        
        if let number = formatter.number(from: cleanedString) {
            return number.doubleValue
        }
        return nil
    }

    func formattedCoordinate(_ coordinate: Double?) -> String {
        guard let coordinate = coordinate else { return "" }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 3
        formatter.maximumFractionDigits = 3
        
        let formattedString = formatter.string(from: NSNumber(value: coordinate)) ?? "--"
        return "\(formattedString)°"
    }

    func formattedDuration(_ duration: TimeInterval) -> String {
       let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
       return formatter.string(from: duration) ?? ""
    }

    func formattedDate(_ date: Date) -> String {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       formatter.timeStyle = .short
       return formatter.string(from: date)
    }

}

