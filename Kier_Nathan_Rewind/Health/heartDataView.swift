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
    @State private var heartRate1: [heart] = [heart]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        let endDate = Date()

        heartRate1.removeAll()

        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            guard let count = statistics.minimumQuantity()?.doubleValue(for: HKUnit.count().unitDivided(by: .minute())) else {
                return // skip if count is nil
            }
            let heart = heart(count: Int(count), date: statistics.startDate)
            heartRate1.append(heart)
        }
        print(heartRate1)
    }


    var body: some View {
        
        NavigationView {
        
            if heartRate1.isEmpty {
                Text("No heart rate data available")
            } else {
                heartGraphView(heartForGraph: heartRate1)
            }
        
        }
        .navigationTitle("Heartrate This Week")
        .navigationBarTitleDisplayMode(.inline)
       
        
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
