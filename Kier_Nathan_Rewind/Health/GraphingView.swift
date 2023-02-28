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
    
    let milesForGraph: [Mile]
    
    var totalmiles: Int {
        milesForGraph.map { Int($0.count) }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(milesForGraph, id: \.id) { mile in
                        
                        let yValue = Swift.min(mile.count/0.09, 90)
                        
                        VStack {
                            Text("\(mile.count)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(mile.count > 7 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(mile.date,formatter: Self.dateFormatter)")
                                .font(.caption)
                            
                        }
                    }
                    
                }
                
                Text("Keep Pushing, you can do better! LeBron would do better").padding(.top, 100)
                    .foregroundColor(Color.red)
                    
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(10)
        }
    }
}

struct GraphingView_Previews: PreviewProvider {
    static var previews: some View {
        
        let miles = [
            Mile(count: 3.52, date: Date()),
            Mile(count: 1.23, date: Date()),
            Mile(count: 12.23, date: Date()),
            Mile(count: 52.23, date: Date()),
            Mile(count: 12.023, date: Date())
               ]
        
        GraphingView(milesForGraph: miles)
    }
}
