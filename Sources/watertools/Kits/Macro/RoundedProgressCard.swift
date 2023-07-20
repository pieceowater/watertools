//
//  RoundedProgressCard.swift
//  
//
//  Created by yury mid on 21.07.2023.
//

import SwiftUI

public struct RoundedProgressCard: View {
    let icon: Image
    let title: String
    let description: String?
    let currentCount: Int
    let maxCount: Int?
    let progressAction: (() -> Void)?
    
    public init(icon: Image, title: String, description: String? = nil, currentCount: Int, maxCount: Int? = nil, progressAction: (() -> Void)? = nil) {
        self.icon = icon
        self.title = title
        self.description = description
        self.currentCount = currentCount
        self.maxCount = maxCount
        self.progressAction = progressAction
    }
    
    public var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    icon
                        .resizable()
                        .frame(width: 45, height: 45)
                        .padding(.horizontal, 5)
                    Text(title)
                        .minimumScaleFactor(0.8)
                        .lineLimit(2)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                }
                if let description = description {
                    if !description.isEmpty {
                        Text(description)
                            .font(.caption)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                
                HStack(spacing: 0) {
                    Text("\(currentCount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .lineLimit(1)
                    if let maxCount = maxCount {
                        Text("/ \(maxCount)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
                
            }
            Spacer()
            VStack{
                ZStack {
                    Circle()
                        .stroke(lineWidth: 10)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    
                    if let maxCount = maxCount {
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(Double(currentCount) / Double(maxCount), 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 13, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.accentColor)
                            .rotationEffect(Angle(degrees: -90))
                    }
                        
                    if let progressAction = progressAction {
                        Image(systemName: "plus")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .onTapGesture {
                                withAnimation {
                                    progressAction()
                                }
                            }
                    } else {
                        if let maxCount = maxCount {
                            Text("\(Int((CGFloat(min(Double(currentCount) / Double(maxCount), 1.0) * 100).rounded())))%")
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
                }
                .frame(width: 70, height: 70)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}
