//
//  VidView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/07/2022.
//

import SwiftUI

struct VidView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
                Text("Welcome To Rewind Tips \(Image(systemName: "clock.circle.fill"))")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                Spacer()
                VStack{
                    Text("Shooting Tips from Kobe himself")
                    videoView(videoID: "aSqeWUuQSlM")
                        .frame( width: 420, height: 250)
                }
                Spacer()
                VStack {
                    Text("Defence Tips from Ryan Razooky")
                    videoView(videoID: "38-B2Dtni1M")
                        .frame( width: 420, height: 250)
                }
                Spacer()
                VStack {
                    Text("Kyries' spin move with help from THINCPRO")
                    videoView(videoID: "Z2DgU9vrWyg")
                        .frame( width: 420, height: 250)
                }
                

                
            }
            .foregroundColor(.red)
            
            
        }
        
    }
}

struct VidView_Previews: PreviewProvider {
    static var previews: some View {
        VidView()
    }
}
