//
//  dataTestView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 07/07/2022.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let username: String
    let madeShots: Int
    let missedShots: Int
    let totalShots: Int
    let isVerified: Bool
}

class DataTestViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var newArray: [Int] = []
    
    
    init() {
        getUsers()
        updateFiltA()
        getpercentShooting()
    }
    
    func updateFiltA() {
       // filteredArray = dataArray.sorted { (user1, user2) -> Bool in
         //   return user1.madeShots > user2.madeShots
      //  }
       filteredArray = dataArray.sorted(by: { $0.madeShots < $1.madeShots})
        
    }
    func getpercentShooting() {
        newArray = dataArray.map({ (user) -> Int in
            return user.madeShots/user.totalShots
        }) }
    
    func getUsers() {
        let user1 = UserModel(username:"Nathan", madeShots: 60, missedShots: 100, totalShots: 160, isVerified: true)
        let user2 = UserModel(username:"Matthew", madeShots: 80, missedShots: 80, totalShots: 160, isVerified: true)
        let user3 = UserModel(username:"nkier200", madeShots: 100, missedShots: 60, totalShots: 160, isVerified: true)
        let user4 = UserModel(username:"me", madeShots: 80, missedShots: 80, totalShots: 160, isVerified: true)
        let user5 = UserModel(username:"John", madeShots: 40, missedShots: 120, totalShots: 160, isVerified: true)
        let user6 = UserModel(username:"Joe", madeShots: 120, missedShots: 40, totalShots: 160, isVerified: true)
        let user7 = UserModel(username:"Frank", madeShots: 0, missedShots: 160, totalShots: 160, isVerified: true)
        let user8 = UserModel(username:"Alan", madeShots: 40, missedShots: 120, totalShots: 160, isVerified: true)
        let user9 = UserModel(username:"Sandy", madeShots: 8, missedShots: 152, totalShots: 160, isVerified: true)
        let user10 = UserModel(username:"Will", madeShots: 70, missedShots: 90, totalShots: 160, isVerified: true)
        self.dataArray.append(contentsOf: [
        user1,
        user2,
        user3,
        user4,
        user5,
        user6,
        user7,
        user8,
        user9,
        user10,
        ])
        
    }
}

struct dataTestView: View {
    @StateObject var vm = DataTestViewModel()
    
    var body: some View {
        ScrollView {
            VStack (spacing:30) {
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.username)
                        HStack {
                            Text("Made Shots: \(user.madeShots)")
                            Text("missed Shots: \(user.missedShots)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "clock.circle.fill")
                            }
                        }
                        
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.black.cornerRadius(15))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct dataTestView_Previews: PreviewProvider {
    static var previews: some View {
        dataTestView()
    }
}
