//
//  RoadmapItem.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

@available(iOS 16.0, *)
public struct RoadmapItem: View {
    var item: Model
    var isFirst: Bool
    var isLast: Bool
    var action: () -> Void
    
    public init(item: Model, isFirst: Bool, isLast: Bool, action: @escaping () -> Void) {
        self.item = item
        self.isFirst = isFirst
        self.isLast = isLast
        self.action = action
    }
    
    public var body: some View {
        HStack{
            VStack {
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 1)
                    .opacity(!isFirst ? 1 : 0)
                
                Image(systemName: item.state ? "checkmark.circle.fill" : "circle.fill")
                    .font(.subheadline)
                    .foregroundColor(item.state ? .accentColor : .secondary)
                
                Rectangle()
                    .fill(.secondary)
                    .frame(width: 1)
                    .opacity(!isLast ? 1 : 0)
                
            }
            Button{
                action()
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                    
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    if !item.attachmentURL.isEmpty && watertools.isValidURL(item.attachmentURL){
                        watertools.ExternalLinkBtn(title: watertools.formatURLString(item.attachmentURL) ?? "", url: URL(string: item.attachmentURL)!)
                            .lineLimit(1)
                            .fontWeight(.bold)
                    }
                    
                    HStack(spacing: 5){
                        Image(systemName: "calendar")
                        Text(watertools.formatDate(item.deadline))
                        Spacer()
                    }.font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(item.state ? Color.accentColor : Color.clear, lineWidth: 1)
            )
            .cornerRadius(10)
            .padding(.vertical, 10)
            .padding(.trailing, 10)
        }
    }
    
    public struct Model: Identifiable {
        public var id = UUID()
        public var title: String
        public var description: String
        public var deadline: Date
        public var attachmentURL: String
        public var state: Bool
        
        public init(title: String, description: String, deadline: Date, attachmentURL: String = "", state: Bool = false) {
            self.title = title
            self.description = description
            self.deadline = deadline
            self.attachmentURL = attachmentURL
            self.state = state
        }
    }
}
