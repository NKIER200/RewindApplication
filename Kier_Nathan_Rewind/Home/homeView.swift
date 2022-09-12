//
//  homeView.swift
//  Kier_Nathan_Test
//
//  Created by Nathan Kier on 11/06/2022.
// test

import SwiftUI

struct homeView: View {
    @State private var showForm: Bool = false
    
    @StateObject private var loginFormManager = LoginFormManager()
    var body: some View {
        

            VStack {
                mapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                circleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text("Welcome Home")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    HStack {
                        Text("Are you ready, to Improve?")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Spacer()
                        
                        Text("Start now.")
                            .font(.subheadline)
                            .padding(.top)
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    
                    Text("Nathan Kier, Honours Project")
                        .font(.title2)
                    Text("S1906771")
                    
                    
                    }
                .navigationTitle("Home")
                .toolbar{
                    NavigationLink(destination: (chatsView(chats: .constant(DailyChat.sampleData), saveAction: {}))) {
                        Label("View Chats page", systemImage: "message")
                    }
                                   }
                    
                
            
                .toolbar{
                    NavigationLink(destination: LogView()) {
                        Label("View Account", systemImage: "person")
                    }
                    
                }
                .toolbar{
                    NavigationLink(destination: homeView()) {
                        Label("View Home", systemImage: "house")
                    }
                    
                }
               
                }
                .padding()
                
                Spacer()
                
            }
       
        }
        
struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            homeView()
        }
    }
}
        
    
        
    
        
    

