//
//  botResponse.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 05/07/2022.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMess = message.lowercased()
    
    if tempMess.contains("shoes") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    } else if tempMess.contains("rules") {
        return "Please check out the official FIBA rules if you are unsure on any rules. Looking at you Ruaridh. https://www.fiba.basketball/documents/official-basketball-rules-yellow/2020.pdf"
    } else if tempMess.contains("form") {
        return "You can have teammates and other uses help you with form by submitting a video for them to review. Or check out youtube videos from some of the games greats."
    } else {
        return "Thanks for your question, the helpbot currently doesnt have an answer for you. Please contact me directly at nkier200@Caledonian.ac.uk"
    }
}
