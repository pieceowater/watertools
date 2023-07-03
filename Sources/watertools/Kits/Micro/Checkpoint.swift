//
//  Checkpoint.swift
//  
//
//  Created by yury mid on 03.07.2023.
//

import SwiftUI

public struct Checkpoint: View {
    @Binding private var isChecked: Bool
    let timestamp: Date
    var action: (Bool) -> Void
    
    public init(isChecked: Binding<Bool> = .constant(false), timestamp: Date, action: @escaping (Bool) -> Void) {
        self._isChecked = isChecked
        self.timestamp = timestamp
        self.action = action
    }
    
    public var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isChecked ? .accentColor : .gray)
                .font(.system(size: 24))
            Divider()
            Text(watertools.formattedDate(timestamp))
                .font(.headline)
            Spacer()
        }
        .padding()
        .onTapGesture {
            action(isChecked)
        }
    }
}
