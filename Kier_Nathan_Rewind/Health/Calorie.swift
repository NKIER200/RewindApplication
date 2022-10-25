//
//  calorie.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/10/2022.
//

import Foundation
struct Calorie: Identifiable {
    let id = UUID()
    let kcal: Int
    let date: Date
}
