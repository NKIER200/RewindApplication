//
//  houseView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 04/07/2022.
//

import SwiftUI

struct houseView: View {
    
    @State private var newsText = "Enter this weeks news"
    var body: some View {
        ScrollView {
            VStack {
                mapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                circleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .center) {
                    
                    Text("Welcome To Rewind \(Image(systemName: "clock.circle.fill"))")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                        
                        .font(.system(size: 30))
                                           
                    Divider()
                   
                    VStack {
                        Text("App Information")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                            
                            .font(.system(size: 30))
                    }
                    
                    VStack {
                        
                        HStack{
                            Text("The Help page \(Image(systemName: "clock.circle.fill"))  provides explanations of players and technical terms.")
                        }
                        
                        Divider()
                        HStack{
                            Text("Access the Videos page \(Image(systemName: "play")) to learn from greats of the game")
                        }
                        
                        Divider()
                        HStack{
                            Text("Use the Improve page \(Image(systemName: "pencil")) to document your training sessions. Make notes on what worked and what didn't")
                        }
                        
                        Divider()
                        HStack {
                            Text("To access your health information graphs \(Image(systemName: "heart")), click the More page \(Image(systemName: "ellipsis")) on the right.")
                        }
                        Divider()
                        HStack{
                            Text("You can also find the settings page \(Image(systemName: "gear")) in More.")
                        }
                    }
                            
                        
                          
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        Divider()
                        VStack{
                            Text("Nathan Kier, Honours Project")
                                .font(.title2)
                                
                            Text("S1906771, nkier200@icloud.com")
                                
                        }
                        
                        
                }
                .multilineTextAlignment(.center)
                
                .navigationTitle("Home")
            }
            
        }
        
    }
       
    
}

struct houseView_Previews: PreviewProvider {
    static var previews: some View {
        houseView()
    }
}
