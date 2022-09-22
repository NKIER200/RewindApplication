//
//  GraphingView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 22/09/2022.
//

import SwiftUI

struct GraphingView: View {
    
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    }()
    
    let kmForGraph: [km]
    
    var totalStepsTaken: Int {
        kmForGraph.map { Int($0.count) }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(kmForGraph, id: \.id) { km in
                        
                        let yValue = Swift.min(km.count/20, 300)
                        
                        VStack {
                            Text("\(km.count)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(km.count > 7000 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(km.date,formatter: Self.dateFormatter)")
                                .font(.caption)
                            
                        }
                    }
                    
                }
                
                Text("Total Steps: \(totalStepsTaken)").padding(.top, 100)
                    .foregroundColor(Color.red)
                    .opacity(0.9)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(10)
        }
    }
}

struct GraphingView_Previews: PreviewProvider {
    static var previews: some View {
        
        let kilometers = [
                   km(count: 3452, date: Date()),
                   km(count: 123, date: Date()),
                   km(count: 1223, date: Date()),
                   km(count: 5223, date: Date()),
                   km(count: 12023, date: Date())
               ]
        
        GraphingView(kmForGraph: kilometers)
    }
}
