//
//  SettingsView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 04/07/2022.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    @Binding var isGrayScale: Bool
    @Binding var isDeviceSettings: Bool
    @State private var store = ChatStore()
    @State private var errorwrapper: errorWrapper?
    var body: some View {
        NavigationView {
            
            Form{
                
                Section(header: Text("Display"),
                        footer: Text("Device settings will overide the applications Dark Mode or Gray Scale  and will use the Devices current theme.")) {
                    Toggle(isOn: $isDarkMode,
                           label: {
                        Text("Dark Mode")
                    })
                    .onChange(of: isDarkMode, perform: { _ in
                        systemThemeManager
                            .shared
                            .handleTheme(darkMode: isDarkMode, grayScale: isGrayScale, system: isDeviceSettings)
                    })
                    Toggle(isOn: $isGrayScale,
                           label: {
                        Text("Gray Scale")
                    })
                    .onChange(of: isGrayScale, perform: { _ in
                        systemThemeManager
                            .shared
                            .handleTheme(darkMode: isDarkMode, grayScale: isGrayScale, system: isDeviceSettings)
                        
                    })
                    
                    Toggle(isOn: $isDeviceSettings,
                           label: {
                        Text("Use Device Settings")
                        
                    })
                    .onChange(of: isDeviceSettings, perform: { _ in
                        systemThemeManager
                            .shared
                            .handleTheme(darkMode: isDarkMode, grayScale: isGrayScale, system: isDeviceSettings)
                    })
                    
                }
            }
                    Section {
                        Label("Check out my GitHub nkier200", systemImage: "link")
                    }
                    
                }
                .navigationTitle("Settings")
            }
            
                    }
        

        
        
    
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(isDarkMode: .constant(false), isGrayScale: .constant(false), isDeviceSettings: .constant(false))
        }
    }

