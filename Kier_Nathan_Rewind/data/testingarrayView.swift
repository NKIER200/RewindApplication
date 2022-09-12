//
//  testingarrayView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 09/08/2022.
//

import SwiftUI

struct testingarrayView: View {
    let scrum: UserArray
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Session Info")) {
                HStack {
                    Label("Session Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("User Details")) {
                ForEach(scrum.users) { user in
                    Label(user.userType, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.username)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                testingeditView()
            }
        }
    }
}

struct testingarrayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            testingarrayView(scrum: UserArray.sampleData[0])
        }
    }
}
