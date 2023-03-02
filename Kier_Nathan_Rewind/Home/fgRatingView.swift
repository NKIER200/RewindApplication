//
//  fgRatingView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/01/2023.
//

import SwiftUI

struct fgRatingView: View {
    let fieldGoals: Int16
    
    var body: some View {
        switch fieldGoals {
        case 0:
            return Text("🫣")
        case 1...25:
            return Text("🥶")
        case 26...50:
            return Text("😟")
        case 51...75:
            return Text("👍")
        case 76...100:
            return Text("🤯")
        case 101...175:
            return Text("😎")
        case 176...275:
            return Text("🏀")
        case 276...400:
            return Text("🔥")
        case 401...450:
            return Text("🤩")
        case 451...480:
            return Text("😳")
        case 481...500:
            return Text("NBA")
        default:
            return Text("NBA Player")
            
            
        }
    }
}

struct fgRatingView_Previews: PreviewProvider {
    static var previews: some View {
        fgRatingView(fieldGoals: 3)
    }
}
