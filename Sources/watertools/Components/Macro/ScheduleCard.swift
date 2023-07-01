//
//  ScheduleCard.swift
//  
//
//  Created by yury mid on 01.07.2023.
//

import SwiftUI

public struct ScheduleCard<Destination:View>: View {
    let icon: Image
    let title: String
    let comment: String
    var weekdays: [Bool]
    var weekdayNames: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var weekdayAction: (_ index: Int) -> Void
    let weekdayContextMenuTitle: String
    var weekdayContextMenuAction: (_ index: Int) -> Void
    let streak: Int
    let destination: Destination
    let navBtnText: String
    
    public init(icon: Image, title: String, comment: String, streak: Int = 0, weekdays: [Bool], weekdayAction: @escaping (_: Int) -> Void, weekdayContextMenuTitle: String, weekdayContextMenuAction: @escaping (_: Int) -> Void, destination: Destination, navBtnText: String) {
        self.icon = icon
        self.title = title
        self.comment = comment
        self.streak = streak
        self.weekdays = weekdays
        self.weekdayAction = weekdayAction
        self.weekdayContextMenuTitle = weekdayContextMenuTitle
        self.weekdayContextMenuAction = weekdayContextMenuAction
        self.destination = destination
        self.navBtnText = navBtnText
    }
    
    public var body: some View {
        VStack {
            HStack {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    Text(comment)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    NavigationLink {
                        destination
                    } label: {
                        HStack{
                            Text(navBtnText)
                            Image(systemName: "arrow.right")
                        }
                        .font(.subheadline)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    }
                }
                Spacer()
                if streak > 1 {
                    HStack(spacing: 1){
                        Image(systemName: "flame.fill")
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Text("\(streak)")
                            .font(.headline)
                    }
                }
            }
            .padding(.bottom)
            
            HStack(spacing: 5) {
                ForEach(0..<weekdays.count, id: \.self) { index in
                    Button(action: {
                        weekdayAction(index)
                    }) {
                        Text(weekdayNames[index])
                            .font(.subheadline)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(weekdays[index] ? .accentColor : .gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(weekdays[index] ? Color.accentColor.opacity(0.15) : Color.gray.opacity(0.15))
                            )
                    }
                    .contextMenu {
                        Button {
                            weekdayContextMenuAction(index)
                        } label: {
                            Text(weekdayContextMenuTitle)
                        }
                        
                    }
                }
            }
        }
    }
}
