//
//  GraphView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 15/08/2022.
//

import SwiftUI

struct GraphView: View {
    
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    }()
    
    let stepsForTheGraph: [Step]
    
    var totalStepsT: Int {
        stepsForTheGraph.map { $0.count }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(stepsForTheGraph, id: \.id) { step in
                        
                        let yValue = Swift.min(step.count/20, 300)
                        
                        VStack {
                            Text("\(step.count)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(step.count > 7000 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(step.date,formatter: Self.dateFormatter)")
                                .font(.caption)
                            
                        }
                    }
                    
                }
                
                Text("Total Steps: \(totalStepsT)").padding(.top, 100)
                    .foregroundColor(Color.red)
                    .opacity(0.9)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(10)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        
        let steps = [
                   Step(count: 3452, date: Date()),
                   Step(count: 123, date: Date()),
                   Step(count: 1223, date: Date()),
                   Step(count: 5223, date: Date()),
                   Step(count: 12023, date: Date())
               ]
        
        GraphView(stepsForTheGraph: steps)
    }
}
