//
//  HealthInfoStore.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 15/08/2022.
// mine
//health information store

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
    //initialises health store
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    //Function to calculate steps
    
    // This function calculates the user's daily step count from the past 14 days
    // using the HealthKit framework in iOS.
    func calculatetheSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        
        // Set the step type to the stepCount from the user's Apple Health.
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        // Get the start date as 14 days before the current date.
        let startDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        // Get the anchor date as the most recent Monday at midnight.
        let anchorDate = Date.mondayAt12AM()
        
        // Set the interval to daily.
        let daily = DateComponents(day: 1)
        
        // Set the predicate to samples with a start date greater than or equal to the start date.
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        // Create a statistics collection query with the given parameters.
        query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        // Set the initial results handler to call the completion closure with the statistics collection.
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        // Execute the query using the HealthKit store.
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    // This function calculates the user's distance walked or run in meters from the past 14 days
    // using the HealthKit framework in iOS.
    func calculateWR(completion: @escaping (HKStatisticsCollection?) -> Void) {
        
        // Set the quantity type to distance walked or run.
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        
        // Get the start date as 14 days before the current date.
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        // Get the anchor date as the most recent Monday at midnight.
        let anchoredDate = Date.mondayAt12AM()
        
        // Set the interval to daily.
        let daily2 = DateComponents(day: 1)
        
        // Set the predicate to samples with a start date greater than or equal to the start date.
        let predicate2 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        // Create a statistics collection query with the given parameters.
        query = HKStatisticsCollectionQuery(quantityType: move, quantitySamplePredicate: predicate2, options: .cumulativeSum, anchorDate: anchoredDate, intervalComponents: daily2)
        
        // Set the initial results handler to call the completion closure with the statistics collection.
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        // Execute the query using the HealthKit store.
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    func calculateHeart(completion: @escaping (HKStatisticsCollection?) -> Void) {
        // Create a HKQuantityType object for heart rate
        let heartRate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        
        // Set the starting date for the query to 14 days before the current date
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        // Create an anchored date that represents the start of the week (Monday at 12 AM)
        let anchoredDate = Date.mondayAt12AM()
        
        // Set the interval for the query to daily
        let daily3 = DateComponents(day: 1)
        
        // Create a predicate that specifies the date range for the query
        let predicate3 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        // Create a HKStatisticsCollectionQuery with the heart rate quantity type, the predicate, a discrete most recent option, the anchored date, and the daily interval components
        query = HKStatisticsCollectionQuery(quantityType: heartRate, quantitySamplePredicate: predicate3, options: .discreteMostRecent, anchorDate: anchoredDate, intervalComponents: daily3)
        
        // Set the initial results handler to pass the statisticsCollection to the completion handler
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        // Execute the query using the healthStore if it exists, along with the query if it was successfully created
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    func calculateCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        // Set the calorie type to active energy burned from HealthKit
        let kcal = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        // Set the start date to 14 days ago
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        // Set the anchor date to the beginning of the current week
        let anchoredDate = Date.mondayAt12AM()
        
        // Set the interval to daily
        let daily4 = DateComponents(day: 1)
        
        // Set the predicate to include samples from the start date until now
        let predicate4 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        // Create a query for the calorie statistics collection
        query = HKStatisticsCollectionQuery(quantityType: kcal, quantitySamplePredicate: predicate4, options: .discreteMostRecent, anchorDate: anchoredDate, intervalComponents: daily4)
        
        // Set the initial results handler to return the statistics collection when ready
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        // Execute the query if the health store and query exist
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    func calculateAMT(completion: @escaping (HKStatisticsCollection?) -> Void) {
        // AMT is the "Apple Exercise Time" quantity type
        let amt = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        
        // Set the starting date to 14 days before today
        let startingDate = Calendar.current.date(byAdding: .day, value: -14, to: Date())
        
        // Set the anchor date to the most recent Monday at 12:00 AM
        let anchoredDate = Date.mondayAt12AM()
        
        // Set the interval to daily (i.e. one data point per day)
        let daily5 = DateComponents(day: 1)
        
        // Define a predicate to query for samples between the starting date and today
        let predicate5 = HKQuery.predicateForSamples(withStart: startingDate, end: Date(), options: .strictStartDate)
        
        // Create a statistics collection query for the AMT quantity type, with the specified predicate and options
        query = HKStatisticsCollectionQuery(quantityType: amt, quantitySamplePredicate: predicate5, options: .cumulativeSum, anchorDate: anchoredDate, intervalComponents: daily5)
        
        // Set the completion handler to return the statistics collection
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        // If the health store and query are both non-nil, execute the query
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }

    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        // Define the health data type to request authorization for
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        // Get a reference to the health store
        guard let healthStore = self.healthStore else { return completion(false) }
        
        // Request authorization to read step count data
        healthStore.requestAuthorization(toShare: [], read: [stepType]) { (success, error) in
            completion(success)
        }
    }

    func reqAuth2(completion: @escaping (Bool) -> Void) {
        // Define the health data type to request authorization for
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        
        // Get a reference to the health store
        guard let healthStore = self.healthStore else { return completion(false) }
        
        // Request authorization to read distance data
        healthStore.requestAuthorization(toShare: [], read: [move]) { (success, error) in
            completion(success)
        }
    }

    func reqAuth3(completion: @escaping (Bool) -> Void) {
        // Define the health data type to request authorization for
        let heartRate = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        
        // Get a reference to the health store
        guard let healthStore = self.healthStore else { return completion(false) }
        
        // Request authorization to read heart rate data
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
        // Get the HKQuantityType for active energy burned
        let kcal = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        // Check if the health store is available
        guard let healthStore = self.healthStore else { return completion(false) }
        
        // Request authorization from the user to read the active energy burned data
        healthStore.requestAuthorization(toShare: [], read: [kcal]) { (success, error) in
            completion(success)
        }
    }

    func reqAuth5(completion: @escaping (Bool) -> Void) {
        // Get the HKQuantityType for apple exercise time
        let move = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.appleExerciseTime)!
        
        // Check if the health store is available
        guard let healthStore = self.healthStore else { return completion(false) }
        
        // Request authorization from the user to read the apple exercise time data
        healthStore.requestAuthorization(toShare: [], read: [move]) { (success, error) in
            completion(success)
        }
    }

}
