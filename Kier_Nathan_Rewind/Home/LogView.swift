//
//  LogView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 27/06/2022.
//

import SwiftUI

struct LogView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.75)
                    .foregroundColor(.red)

                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                        }
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.red)
                    .frame(width: 300, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                    NavigationLink(destination:  testView(),  isActive: $showingLoginScreen ) {
                        EmptyView()
                            .navigationBarHidden(true)
                            
                    }
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    
                } .navigationBarHidden(true)
            }
                .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "nkier200" {
            wrongUsername = 0
            if password.lowercased() == "test" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LogView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
