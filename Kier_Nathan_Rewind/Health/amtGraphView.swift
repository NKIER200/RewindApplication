//
//  amtGraphView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 28/02/2023.
//

import SwiftUI

import SwiftUI

struct amtGraphView: View {
    
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    }()
    
    let amtForGraph: [AMT]
    
    var totalamt: Int {
        amtForGraph.map { Int($0.count) }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(amtForGraph, id: \.id) { amt in
                        
                        let yValue = Swift.min(amt.count/0.09, 90)
                        
                        VStack {
                            Text("\(amt.count)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(amt.count > 7 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(amt.date,formatter: Self.dateFormatter)")
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

struct amtGraphView_Previews: PreviewProvider {
    static var previews: some View {
        
        let amts = [
            AMT(count: 3.52, date: Date()),
            AMT(count: 1.23, date: Date()),
            AMT(count: 12.23, date: Date()),
            AMT(count: 52.23, date: Date()),
            AMT(count: 12.023, date: Date())
               ]
        
        amtGraphView(amtForGraph: amts)
    }
}
