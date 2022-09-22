//
//  moveDataView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 22/09/2022.
//

import SwiftUI
import HealthKit

struct moveDataView: View {
    
    private var healthStore: HealthStore?
    @State private var kilometers: [km] = [km]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = km(count: Double(count ?? 0), date: statistics.startDate)
            kilometers.append(step)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
        
            GraphingView(kmForGraph: kilometers)
            
        .navigationTitle("Steps Taken This Week")
        }
       
        
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.requestAuthorization { success in
                        if success {
                            healthStore.calculateSteps { statisticsCollection in
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
struct moveDataView_Previews: PreviewProvider {
    static var previews: some View {
        moveDataView()
   
    }
}
