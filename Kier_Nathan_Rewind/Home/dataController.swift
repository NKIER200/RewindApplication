//
//  dataController.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/01/2023.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "testModel")
    
    init(){
        container.loadPersistentStores{ descriptoin, error in
            if let error = error {
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
