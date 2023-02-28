//
//  heartRateChartView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 28/02/2023.
//

import SwiftUI

struct HeartRateChartView: View {
    let dataPoints: [String]
    let values: [Int]
    let valueCaption: String
    
    init(dataPoints: [String], values: [Int], valueCaption: String) {
        self.dataPoints = dataPoints
        self.values = values
        self.valueCaption = valueCaption
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(dataPoints, id: \.self) { point in
                    Text(point)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }
            
            GeometryReader { geo in
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(values, id: \.self) { value in
                        VStack {
                            Spacer()
                            ZStack(alignment: .bottom) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue.opacity(0.3))
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                                    .frame(height: CGFloat(value) * geo.size.height / CGFloat(values.max() ?? 0))
                            }
                            Text("\(value) \(valueCaption)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

struct HeartRateChartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateChartView(dataPoints: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], values: [60, 70, 80, 90, 100, 110, 120], valueCaption: "bpm")
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
