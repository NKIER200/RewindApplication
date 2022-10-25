//
//  calorieGraphView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/10/2022.
//

import SwiftUI

struct calorieGraphView: View {
    
    
    static let dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
        
    }()
    
    let calForGraph: [Calorie]
    
    var totalCalorie: Int {
        calForGraph.map { $0.kcal }.reduce(0,+)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    
                    ForEach(calForGraph, id: \.id) { calorie in
                        
                        let yValue = Swift.min(calorie.kcal/20, 300)
                        
                        VStack {
                            Text("\(calorie.kcal)")
                                .font(.caption)
                            
                            Rectangle()
                                .fill(calorie.kcal > 140 ? Color.yellow :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(calorie.date,formatter: Self.dateFormatter)")
                                .font(.caption)
                            
                        }
                    }
                    
                }
                
                Text("Total Kcal: \(totalCalorie)").padding(.top, 100)
                    .foregroundColor(Color.red)
                    .opacity(0.9)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding(10)
        }
    }
}

struct calorieGraphView_Previews: PreviewProvider {
    static var previews: some View {
        
        let calories = [
            Calorie(kcal: 35, date: Date()),
            Calorie(kcal: 123, date: Date()),
            Calorie(kcal: 73, date: Date()),
            Calorie(kcal: 63, date: Date()),
            Calorie(kcal: 12023, date: Date())
               ]
        
        calorieGraphView(calForGraph: calories)
    }
}

