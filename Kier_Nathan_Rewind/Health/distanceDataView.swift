//
//  distanceDataView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 15/08/2022.
//

import SwiftUI
import HealthKit

struct distanceDataView: View {
    
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        //sets start date for graph
        //two weeks before current day
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
        //sets the end date to today
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
        
        GraphView(stepsForGraph: steps)
            
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

struct distanceDataView_Previews: PreviewProvider {
    static var previews: some View {
        distanceDataView()
    }
}
