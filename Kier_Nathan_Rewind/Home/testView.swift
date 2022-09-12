//
//  testView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 04/07/2022.
//

import SwiftUI

struct testView: View {
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
            
            testingarrayView(scrum: UserArray.sampleData[0])
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            botView()
                .tabItem {
                    Image(systemName: "clock.circle")
                    Text("Help")
                }
            VidView()
            
                .tabItem {
                    Image(systemName: "play")
                    Text("Videos")
                }
            formView {_ in}
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }
            distanceDataView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Distance")
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
