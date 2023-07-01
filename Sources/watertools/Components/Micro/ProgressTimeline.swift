//
//  ProgressTimeline.swift
//  
//
//  Created by yury mid on 01.07.2023.
//

import SwiftUI

public struct ProgressTimeline: View {
    public let checkedStepsCount: Int
    public let commonStepsCount: Int
    
    public init(checkedStepsCount: Int, commonStepsCount: Int) {
        self.checkedStepsCount = checkedStepsCount
        self.commonStepsCount = commonStepsCount
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 4) {
                ForEach(0..<commonStepsCount, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(index < checkedStepsCount ? Color.accentColor : Color.gray.opacity(0.4))
                        .frame(width: ((geometry.size.width / CGFloat(commonStepsCount)) - 4.0), height: 10)
                }
            }
        }
    }
}
