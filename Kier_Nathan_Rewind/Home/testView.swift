//
//  testView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 04/07/2022.
//

import SwiftUI
import OpenAISwift

struct testView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var entrys: FetchedResults<ToDoItem>
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isDeviceSettings") private var isDeviceSettings = false
    @AppStorage("isGrayScale") private var isGrayScale = false
    var body: some View {
        TabView {
            
            houseView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            
            testmlView()
                .tabItem {
                    Image(systemName: "clock.circle")
                    Text("Help")
                }
            VidView()
            
                .tabItem {
                    Image(systemName: "play")
                    Text("Videos")
                }
            todoentryView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Improve")
                }
            
            distanceDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Steps Covered")
                }
            
            moveDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Miles covered")
                }
            
            heartDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Resting Heartrate")
                }
            
            calorieDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Active Calories")
                }
            
            amtDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Excercise Minutes")
                }
            
            
            SettingsView(isDarkMode: $isDarkMode, isGrayScale: $isGrayScale, isDeviceSettings: $isDeviceSettings)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            systemThemeManager
                .shared
                .handleTheme(darkMode: isDarkMode, grayScale: isGrayScale, system: isDeviceSettings)
        }
        .navigationBarHidden(true)
            }
    }


struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
