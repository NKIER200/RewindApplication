//
//  heartGraphView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/10/2022.
//

import SwiftUI

struct heartGraphView: View {
    
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    }()
    
    let heartForGraph: [heart]
    
    var totalheart: Int {
        heartForGraph.map { $0.count }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(heartForGraph, id: \.id) { heart in
                        
                        let yValue = Swift.min(heart.count/1, 90)
                        
                        VStack {
                            Text("\(heart.count)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(heart.count > 140 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(heart.date,formatter: Self.dateFormatter)")
                                .font(.caption)
                            
                        }
                    }
                    
                }
                
                Text("Resting Heartrate: \(totalheart)").padding(.top, 100)
                    .foregroundColor(Color.red)
                    .opacity(0.9)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(10)
        }
    }
}

struct heartGraphView_Previews: PreviewProvider {
    static var previews: some View {
        
        let restingHeart = [
            heart(count: 35, date: Date()),
            heart(count: 123, date: Date()),
            heart(count: 73, date: Date()),
            heart(count: 63, date: Date()),
            heart(count: 12023, date: Date())
               ]
        
        heartGraphView(heartForGraph: restingHeart)
    }
}
