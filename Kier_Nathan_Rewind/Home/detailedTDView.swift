//
//  detailedTDView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/01/2023.
//

import SwiftUI

struct detailedTDView: View {
    let entry: ToDoItem
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Text(entry.review ?? "Unknown")
                    .padding()
                
            }
            fgRatingView(fieldGoals: entry.fieldGoals)
                .font(.largeTitle)
                .padding()
            
            Text("Field Goals Made:\(entry.fieldGoals)")
                .padding()
            Text("Field Goals Attempted:\(entry.fieldGoalAttempts)")
                .padding()
            
            
            
                
            
        }
        .navigationTitle(entry.title ?? "Unknown Session")
    }
}


