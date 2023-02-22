//
//  heartDataView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/10/2022.
//

import SwiftUI
import HealthKit

struct heartDataView: View {
    
    private var healthStore: HealthStore?
    @State private var restingHeart: [heart] = [heart]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let hearts = heart(count: Int(count ?? 0), date: statistics.startDate)
            restingHeart.append(hearts)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
        
            heartGraphView(heartForGraph: restingHeart)
            
        .navigationTitle("Resting Heartrate This Week")
        }
       
        
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.reqAuth3 { success in
                        if success {
                            healthStore.calculateHeart { statisticsCollection in
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
struct heartDataView_Previews: PreviewProvider {
    static var previews: some View {
        heartDataView()
   
    }
}
