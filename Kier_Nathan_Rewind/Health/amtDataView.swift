//
//  amtDataView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 28/02/2023.
//

import SwiftUI
import HealthKit

struct amtDataView: View {
    
    private var healthStore: HealthStore?
    @State private var amts: [AMT] = [AMT]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .hour())
            
            let amt = AMT(count: Double(count ?? 0), date: statistics.startDate)
            amts.append(amt)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
        
            amtGraphView(amtForGraph: amts)
            
        .navigationTitle("AMT This Week")
        .navigationBarTitleDisplayMode(.inline)
        }
       
        
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.reqAuth5 { success in
                        if success {
                            healthStore.calculateAMT { statisticsCollection in
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
struct amtDataView_Previews: PreviewProvider {
    static var previews: some View {
        amtDataView()
   
    }
}
