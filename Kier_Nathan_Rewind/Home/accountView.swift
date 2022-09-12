//
//  accountView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct accountView: View {
    var body: some View {
        VStack {
            circleImage()
                .offset(y: -130)
            .padding(.bottom, -130)    }
        
        .navigationTitle("Account")
        .toolbar{
            NavigationLink(destination: (chatsView(chats: .constant(DailyChat.sampleData), saveAction: {}))) {
                Label("View Chats page", systemImage: "message")
            }
        }
        
        
        
        .toolbar{
            NavigationLink(destination: accountView()) {
                Label("View Account", systemImage: "person")
            }
            
        }
        .toolbar{
            NavigationLink(destination: homeView()) {
                Label("View Home", systemImage: "house")
            }
            
        }
    }
}


struct accountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            accountView()
        }
    }
}
