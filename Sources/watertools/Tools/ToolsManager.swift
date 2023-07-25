//
//  ToolsManager.swift
//  
//
//  Created by yury mid on 26.06.2023.
//

import Foundation
import UIKit
import SwiftUI


public func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a, MMM d, yy"
    return formatter.string(from: date)
}

public func formatCurrency(_ amount: Double) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.groupingSeparator = " "
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2
    
    return formatter.string(from: NSNumber(value: amount))
}

public func formatDateMin(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM"
    return formatter.string(from: date )
}

public func formatCurrencyMin(_ amount: Double) -> String? {
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

public func parseNumber(_ numberString: String) -> Double? {
    let cleanedString = numberString
        .replacingOccurrences(of: "[^0-9.,]", with: "", options: .regularExpression)
        .replacingOccurrences(of: ",", with: ".")
    
    return Double(cleanedString) ?? 0
}


public func formattedCoordinate(_ coordinate: Double?) -> String {
    guard let coordinate = coordinate else { return "" }
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 3
    formatter.maximumFractionDigits = 3
    
    let formattedString = formatter.string(from: NSNumber(value: coordinate)) ?? "--"
    return "\(formattedString)°"
}

public func formattedDuration(_ duration: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    return formatter.string(from: duration) ?? ""
}

public func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}

public func isValidURL(_ urlString: String) -> Bool {
    if let url = URL(string: urlString) {
        return UIApplication.shared.canOpenURL(url)
    }
    return false
}

public func formatURLString(_ urlString: String) -> String? {
    if let url = URL(string: urlString),
        let host = url.host {
        
        var formattedString = urlString
        
        if formattedString.hasPrefix("http://") {
            formattedString = String(formattedString.dropFirst(7))
        } else if formattedString.hasPrefix("https://") {
            formattedString = String(formattedString.dropFirst(8))
        }
        
        if let query = url.query {
            formattedString += "?\(query)"
        }
        
        if let fragment = url.fragment {
            formattedString += "#\(fragment)"
        }
        
        return formattedString
    }
    
    return nil
}

public func formatNumberWithThousandsSeparator(_ numberString: String) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "

    guard let number = formatter.number(from: numberString) else {
        return nil
    }

    return formatter.string(from: number)
}

public func calculator(_ inputText: String, roundedSymbolCount: Int? = nil) -> String {
    let inputWithoutSpaces = inputText.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/")
    do {
        let pattern = #"[0-9]+([,.][0-9]+)?|[+\-*/]"#
        let regex = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)

        let range = NSRange(location: 0, length: inputWithoutSpaces.utf16.count)
        let matches = regex.matches(in: inputWithoutSpaces, options: [], range: range)

        let matchedStrings = matches.map { match -> String in
            let matchRange = match.range
            return (inputWithoutSpaces as NSString).substring(with: matchRange)
        }

        var cleanedStrings: [String] = []
        var lastOperator: Character?
        for element in matchedStrings {
            if let operatorSymbol = element.first {
                if operatorSymbol != lastOperator {
                    cleanedStrings.append(element)
                }
                lastOperator = operatorSymbol
            } else {
                cleanedStrings.append(element)
                lastOperator = nil
            }
        }

        var result = String(evaluateExpression(cleanedStrings))
        
        if let roundedSymbolCount = roundedSymbolCount {
            result = String(format: "%.\(roundedSymbolCount)f", Double(result) ?? 0)
        }
        return result
    } catch {
        print("Regex err: \(error)")
        return "0"
    }

    func evaluateExpression(_ expression: [String]) -> Double {
        var operandStack: [Double] = []
        var operatorStack: [Character] = []

        let operatorPriority: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]

        func performOperation(_ operatorSymbol: Character) {
            if let secondOperand = operandStack.popLast(), let firstOperand = operandStack.popLast() {
                switch operatorSymbol {
                case "+":
                    operandStack.append(firstOperand + secondOperand)
                case "-":
                    operandStack.append(firstOperand - secondOperand)
                case "*":
                    operandStack.append(firstOperand * secondOperand)
                case "/":
                    operandStack.append(firstOperand / secondOperand)
                default:
                    break
                }
            }
        }

        for element in expression {
            if let number = Double(element.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: ".")) {
                operandStack.append(number)
            } else if let operatorSymbol = element.first {
                while let lastOperator = operatorStack.last,
                      let lastOperatorPriority = operatorPriority[lastOperator],
                      let currentOperatorPriority = operatorPriority[operatorSymbol],
                      lastOperatorPriority >= currentOperatorPriority {
                    performOperation(lastOperator)
                    operatorStack.removeLast()
                }
                operatorStack.append(operatorSymbol)
            }
        }
        while let operatorSymbol = operatorStack.popLast() {
            performOperation(operatorSymbol)
        }

        return operandStack.first ?? 0.0
    }

}

public func beautifySum(_ number: String) -> String {
    let numberString = number.replacingOccurrences(of: " ", with: "")
    let pattern = #"(?<!\s)\d(?=(\d{3})+([^\d]|$))"#
    let regex = try! NSRegularExpression(pattern: pattern)

    let range = NSRange(location: 0, length: numberString.utf16.count)
    let formattedString = regex.stringByReplacingMatches(in: numberString, options: [], range: range, withTemplate: "$0 ")

    return formattedString
}
