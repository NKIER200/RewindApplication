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
                VStack(alignment: .leading) {
                    
                    Text("Welcome To Rewind \(Image(systemName: "clock.circle.fill"))")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30))
                        

                    HStack {
                        TextEditor(text: $newsText)
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
                    
                   
                    VStack {
                        Text("This Weeks News")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 30))
                        Spacer()
                        HStack {
                            Text("Boston Celtics rumoured to be including Jaylen Brown in potential trades for kevin durant")
                            Spacer()
                            Text("Matthew Selkirk decimates ankle while imatating Hakeem")
                            
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        HStack{
                            Text("Jimmy Butler is still the worlds greatest player, seen practicing threes with star trainer  Chris Brickley")
                            Spacer()
                            Text("GCU Arc Centre has no courts or hoops available on a random summer Tuesday. Has the world ended?")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        Divider()
                        
                        Text("Nathan Kier, Honours Project")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        Text("S1906771, nkier200@icloud.com")
                            .multilineTextAlignment(.center)
                    }
                    
                        
                }
                
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
