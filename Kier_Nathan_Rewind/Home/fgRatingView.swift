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
            return Text("How?")
        case 1...25:
            return Text("L")
        case 25...50:
            return Text("OK")
        case 50...75:
            return Text("well in")
        case 75...100:
            return Text("nice one")
        case 125...175:
            return Text("very good")
        case 175...275:
            return Text("amazing")
        case 275...400:
            return Text("Woah")
        case 400...450:
            return Text("How are you this good?")
        case 450...480:
            return Text("Incredible")
        case 480...499:
            return Text("SO Close")
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
