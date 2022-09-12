//
//  SplashScreenView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/07/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            LogView()
        } else {
            ZStack {
                Color.red
                    .ignoresSafeArea()
                VStack{
                    
                    VStack{
                        
                        Image(systemName: "clock.circle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                        Text("Rewind")
                            .font(Font.custom("TimesNewRomanPS-BoldMT", size: 50))
                            .foregroundColor(.black)
                        
                    }
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.69)) {
                            self.size = 1.2
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
        
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
