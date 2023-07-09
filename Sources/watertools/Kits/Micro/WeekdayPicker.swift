//
//  WeekdayPicker.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI


public struct WeekdayPicker: View {
    var weekdays: [Bool]
    var weekdayNames: [String]
    var action: (Int) -> Void
    
    public init(weekdays: [Bool], action: @escaping (Int) -> Void) {
        self.weekdays = weekdays
        self.weekdayNames = {
            let calendar = Calendar.current
            let firstWeekdayIndex = calendar.firstWeekday
            let shiftedSymbols = calendar.shortWeekdaySymbols.suffix(from: firstWeekdayIndex - 1)
            let weekdaySymbols = shiftedSymbols + calendar.shortWeekdaySymbols.prefix(upTo: firstWeekdayIndex - 1)
            return Array(weekdaySymbols)
        }()
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 5) {
            ForEach(0..<weekdays.count, id: \.self) { index in
                Button(action: {
                    action(index)
                }) {
                    HStack{
                        Spacer()
                        Text(weekdayNames[index].prefix(3))
                            .font(.subheadline)
                            .minimumScaleFactor(0.6)
                            .lineLimit(1)
                            .foregroundColor(weekdays[index] ? .accentColor : .gray)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(weekdays[index] ? Color.accentColor.opacity(0.15) : Color.gray.opacity(0.15))
                    )
                }
            }
        }
    }
}
