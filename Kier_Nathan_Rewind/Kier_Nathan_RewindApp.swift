//
//  Kier_Nathan_RewindApp.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

@main
struct Kier_Nathan_RewindApp: App {
    @State private var store = ChatStore()
    @State private var errorwrapper: errorWrapper?
    @StateObject private var dataController = DataController()
    var body: some Scene {
       
        WindowGroup {
           
                SplashScreenView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
