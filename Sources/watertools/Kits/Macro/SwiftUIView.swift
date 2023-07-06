//
//  MoneyCard.swift
//  
//
//  Created by yury mid on 06.07.2023.
//

import SwiftUI

public struct MoneyCard: View {
    let title: String
    let icon: Image
    let money: Double
    let lastActivity: Date
    
    public init(title: String = "", icon: Image = Image(systemName: "Start"), money: Double = 0, lastActivity: Date = Date()) {
        self.title = title
        self.icon = icon
        self.money = money
        self.lastActivity = lastActivity
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)

                VStack(alignment: .leading){
                    Text(title)
                        .foregroundColor(.secondary)
                        .font(.title3)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(watertools.formatCurrency(money) ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }.padding(10)

                Spacer()
            }
            HStack{
                Text("\(watertools.formatDate(lastActivity))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(5)
                Spacer()
            }
        }
    }
}
