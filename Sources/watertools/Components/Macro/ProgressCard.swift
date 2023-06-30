//
//  ProgressCard.swift
//  
//
//  Created by yury mid on 01.07.2023.
//

import SwiftUI

public struct ProgressCard: View {
    public let icon: Image
    public let title: String
    public let description: String
    public let deadline: Date
    public let checkedStepsCount: Int
    public let commonStepsCount: Int
    
    public init(icon: Image, title: String, description: String, deadline: Date, checkedStepsCount: Int, commonStepsCount: Int) {
        self.icon = icon
        self.title = title
        self.description = description
        self.deadline = deadline
        self.checkedStepsCount = checkedStepsCount
        self.commonStepsCount = commonStepsCount
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack{
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                }
            }
            HStack{
                Image(systemName: "calendar.badge.clock")
                Text(watertools.formattedDate(deadline))
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .padding(.top, 8)
            
            ProgressTimeline(checkedStepsCount: checkedStepsCount, commonStepsCount: commonStepsCount)
                .padding(.vertical, 10)
            
            HStack{
                Spacer()
            }
        }
    }
    
}
