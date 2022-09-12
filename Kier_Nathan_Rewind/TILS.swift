//
//  TILS.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct TILS: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
    
    }
extension LabelStyle where Self == TILS {
    static var trailingIcon: Self { Self()}
}
