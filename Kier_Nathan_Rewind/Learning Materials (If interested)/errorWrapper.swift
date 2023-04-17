//
//  errorWrapper.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 20/06/2022.
//

import Foundation

struct errorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
