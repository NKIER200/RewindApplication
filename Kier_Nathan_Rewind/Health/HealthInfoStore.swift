//
//  HealthInfoStore.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 15/08/2022.
// mine
//health information store. Hellish place

import Foundation
import HealthKit

extension Date {
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}

class HealthStore {
    
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        let anchorDate = Date.mondayAt12AM()
        
        let daily = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
        
    }
    
    func calculateWR(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        let anchoredDate = Date.mondayAt12AM()
        
        let daily2 = DateComponents(day: 1)
        
        let predicate2 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: move, quantitySamplePredicate: predicate2, options: .cumulativeSum, anchorDate: anchoredDate, intervalComponents: daily2)
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
        
    }
    
    func calculateHeart(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let heartRate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        let anchoredDate = Date.mondayAt12AM()
        
        let daily3 = DateComponents(day: 1)
        
        let predicate3 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: heartRate, quantitySamplePredicate: predicate3, options: .discreteMostRecent, anchorDate: anchoredDate, intervalComponents: daily3)
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
        
    }
    
    func calculateCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let kcal = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        let anchoredDate = Date.mondayAt12AM()
        
        let daily4 = DateComponents(day: 1)
        
        let predicate4 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: kcal, quantitySamplePredicate: predicate4, options: .discreteMostRecent, anchorDate: anchoredDate, intervalComponents: daily4)
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
        
    }
    
    func calculateAMT(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let amt = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        let anchoredDate = Date.mondayAt12AM()
        
        let daily5 = DateComponents(day: 1)
        
        let predicate5 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: amt, quantitySamplePredicate: predicate5, options: .cumulativeSum, anchorDate: anchoredDate, intervalComponents: daily5)
        
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
        
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [stepType]) { (success, error) in
            completion(success)
        }
        
    }
    
    func reqAuth2(completion: @escaping (Bool) -> Void) {
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [move]) { (success, error) in
            completion(success)
        }
    }
    func reqAuth3(completion: @escaping (Bool) -> Void) {
        let heartRate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [heartRate]) { (success, error) in
            completion(success)
            print(completion(success))
            
        }
        
    }
//    func reqAuth3(completion: @escaping (Bool) -> Void) {
//        let heartRateType = HKQuantityType.quantityType(forIdentifier: .restingHeartRate)!
//        let healthDataTypes = Set([heartRateType])
//
//        guard HKHealthStore.isHealthDataAvailable() else {
//            print("Health data is not available.")
//            completion(false)
//            return
//        }
//
//        healthStore.requestAuthorization(toShare: healthDataTypes, read: healthDataTypes) { (success, error) in
//            if let error = error {
//                print("Error requesting health data authorization: \(error.localizedDescription)")
//            }
//            completion(success)
//        }
//    }

    
    func reqAuth4(completion: @escaping (Bool) -> Void) {
        let kcal = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [kcal]) { (success, error) in
            completion(success)
        }
    }
    
    func reqAuth5(completion: @escaping (Bool) -> Void) {
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        
        guard let healthStore = self.healthStore else { return completion(false) }
        
        healthStore.requestAuthorization(toShare: [], read: [move]) { (success, error) in
            completion(success)
        }
    }

}
