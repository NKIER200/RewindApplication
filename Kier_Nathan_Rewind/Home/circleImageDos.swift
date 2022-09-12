//
//  circleImageDos.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 18/06/2022.
//

import SwiftUI

struct circleImageDos: View {
    var body: some View {
        Image("Images")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth:4)
            }
            .shadow(radius: 7)
            
    }
}

struct circleImageDos_Previews: PreviewProvider {
    static var previews: some View {
        circleImageDos()
    }
}
