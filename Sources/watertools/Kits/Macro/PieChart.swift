//
//  PieChart.swift
//  
//
//  Created by yury mid on 27.07.2023.
//

import SwiftUI

public struct PieChart: View {
    public struct PieChartItem {
        public let title: String
        public let value: Double
        public let color: Color
        
        public init(title: String, value: Double, color: Color) {
            self.title = title
            self.value = value
            self.color = color
        }
    }
    
    @Binding public var slices: [PieChart.PieChartItem]
    @State public var showAll: Bool
    @State public var labelState = true
    
    public init(slices: Binding<[PieChart.PieChartItem]>, showAll: Bool = false) {
        self._slices = slices
        self.showAll = showAll
    }
    
    public var body: some View {
        VStack{
            Canvas { context, size in
                
                let donut = Path { p in
                    p.addEllipse(in: CGRect(origin: .zero, size: size))
                    p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
                }
                context.clip(to: donut, style: .init(eoFill: true))
                
                let total = slices.reduce(0) { $0 + $1.value }
                context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                var pieContext = context
                pieContext.rotate(by: .degrees(-90))
                let radius = min(size.width, size.height) * 0.48
                let gapSize = Angle(degrees: 5) // size of the gap between slices in degrees
                
                var startAngle = Angle.zero
                for slice in slices {
                    let value = slice.value
                    let color = slice.color
                    let angle = Angle(degrees: 360 * (value / total))
                    let endAngle = startAngle + angle
                    let path = Path { p in
                        p.move(to: .zero)
                        p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        p.closeSubpath()
                    }
                    pieContext.fill(path, with: .color(color))
                    startAngle = endAngle
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem(.flexible(), alignment: .leading),
                                GridItem(.flexible(), alignment: .leading),
                                GridItem(.flexible(), alignment: .leading)],
                      spacing: 10) {
                ForEach(slices.sorted { $0.value > $1.value }.indices, id: \.self) { index in
                    let slice = slices[index]
                    if !(!showAll && index >= 6) {
                        HStack {
                            slice.color.cornerRadius(100).frame(width: 10, height: 10)
                            Text((labelState ? slice.title : watertools.formatCurrencyMin(slice.value)) ?? "--")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .minimumScaleFactor(0.7)
                                .onTapGesture {
                                    withAnimation {
                                        labelState.toggle()
                                    }
                                }
                        }
                    }
                }
            }.padding(.bottom, 5)

            if slices.count > 6 {
                Button {
                    withAnimation {
                        showAll.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.compact.\(showAll ? "up" : "down")")
                        .font(.largeTitle)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(.ultraThinMaterial)
                        .cornerRadius(5)
                        .padding(.bottom, 5)
                }
            }

            
        }
    }
}
