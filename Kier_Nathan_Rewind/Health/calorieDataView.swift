//
//  calorieDataView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/10/2022.
//

import SwiftUI
import HealthKit

struct calorieDataView: View {
    
    private var healthStore: HealthStore?
    @State private var calories: [Calorie] = [Calorie]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let kcal = statistics.sumQuantity()?.doubleValue(for: .kilocalorie())
            
            let calorie = Calorie(kcal: Int(kcal ?? 0), date: statistics.startDate)
            calories.append(calorie)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
        
            calorieGraphView(calForGraph: calories)
            
        .navigationTitle("Active Calories This Week")
        }
       
        
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.reqAuth4 { success in
                        if success {
                            healthStore.calculateCalories { statisticsCollection in
                                if let statisticsCollection = statisticsCollection {
                                    // update the UI
                                    updateUIFromStatistics(statisticsCollection)
                                }
                            }
                        }
                    }
                }
            }
        
        
    }
}
struct calorieDataView_Previews: PreviewProvider {
    static var previews: some View {
        calorieDataView()
   
    }
}
