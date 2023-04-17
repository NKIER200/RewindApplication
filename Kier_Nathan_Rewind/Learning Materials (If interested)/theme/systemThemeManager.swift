//
//  systemThemeManager.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 04/07/2022.
//

import Foundation
import UIKit

class systemThemeManager {
    
    static let shared = systemThemeManager()
    
    private init() {}
    
    func handleTheme(darkMode: Bool, grayScale: Bool, system: Bool) {
        
        guard !system else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark: .light
    }
}
