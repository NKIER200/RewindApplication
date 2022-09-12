//
//  userArrayView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 08/08/2022.
//

import SwiftUI

struct UserArray: Identifiable, Codable {
    let id: UUID
    var username: String
    var users: [User]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []


init(id: UUID = UUID(), username: String, users: [String], lengthInMinutes: Int, theme: Theme) {
    self.id = id
    self.username = username
    self.users = users.map {User(userType: $0, madeShot: 0, totalShot: 0, shotPercent: 0.0)}
    self.lengthInMinutes = lengthInMinutes
    self.theme = theme
}
    
}

extension UserArray {
    struct User: Identifiable, Codable {
        let id: UUID
        var userType: String
        var madeShot: Int
        var totalShot: Int
        var shotPercent: Double
        
        
        
        init(id: UUID = UUID(), userType: String, madeShot: Int, totalShot: Int, shotPercent: Double) {
            self.id = id
            self.userType = userType
            self.madeShot = madeShot
            self.totalShot = totalShot
            self.shotPercent = shotPercent
           
        }
    }
    
    struct Data {
        var username: String = ""
        var users: [User] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(username: username, users: users, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data:Data) {
        username = data.username
        users = data.users
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
          id = UUID()
        username = data.username
          users = data.users
          lengthInMinutes = Int(data.lengthInMinutes)
          theme = data.theme
      }
}


extension UserArray {
    static let sampleData: [UserArray] =
    [
        UserArray(username: "nkier200", users: ["Wolves Men", "50", "65", "76.9"], lengthInMinutes: 10, theme: .poppy),
        UserArray(username: "MSELK200", users: ["Wolves Men", "50", "60", "83.333"], lengthInMinutes: 5, theme: .orange),
        
    ]
}
