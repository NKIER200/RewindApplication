//
//  botResponse.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 05/07/2022.
//

import Foundation
import SwiftUI
import AVFoundation

func getBotResponse(message: String) -> String {
    let tempMess = message.lowercased()
    
    if tempMess.contains("needing shoes") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    } else if tempMess.contains("looking for a shoe") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("new shoes") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("looking for shoes") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("a pair of shoes") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("shoo") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("shooe") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("shoess") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("shhoe") {
        return "We would recommend checking out https://thehoopgeeks.com in order to find the shoes for you. If you require more detailed information check out Foot Doctor Zach on Youtube."
    }else if tempMess.contains("the fiba rules") {
        return "Please check out the official FIBA rules if you are unsure on any rules. Looking at you Ruaridh. https://www.fiba.basketball/documents/official-basketball-rules-yellow/2020.pdf"
    }else if tempMess.contains("forward shoe") {
        return "Try any Lebrons, Embiids, Nike Zoom Freak 3, MB.01 (these have 0 ventilation)"
    }else if tempMess.contains("guard shoe") {
        return "Try any Currys, Kyrie infinitys, Nike Zoom Freak 3 and MB.01 (these have 0 ventilation)"
    } else if tempMess.contains("form") {
        return "You can have teammates and other uses help you with form by submitting a video for them to review. Or check out our videos section, featuring help from some of the games greats."
    }else if tempMess.contains("videos") {
        return "You can have teammates and other uses help you with form by submitting a video for them to review. Or check out our videos section, featuring help from some of the games greats."
    }else if tempMess.contains("rules of defence") {
        return "peep this gangster, https://wabc.fiba.com/manual/level-1/l1-team/l1-1-defensive-tactics-and-strategies/."
    }else if tempMess.contains("rules of offensive play") {
        return "check this out playa, https://wabc.fiba.com/manual/level-1/l1-team/l1-2-offensive-tactics-and-strategies/"
    }else if tempMess.contains("rules of game management") {
        return "check this out playa, https://wabc.fiba.com/manual/level-1/l1-team/l1-4-game-coaching/"
    }else if tempMess.contains("rules of team management") {
        return "check this out playa, https://wabc.fiba.com/manual/level-1/l1-team/l1-3-management/"
    }else if tempMess.contains("health permission") {
        return "in order to graph your health data, you must allow us access to your Apple Health data. This can be done in the health section."
    }else if tempMess.contains("deez?") {
        return "Deez nuts in your mouth"
    } else if tempMess.contains("need help with my knee pain") {
        return "Sorry to hear that, make sure to try deez."
    } else if tempMess.contains("need to see the goat") {
        return "test failed"
    }else if tempMess.contains("how are you today?") {
        return "I am fine, thank you."
    }else if tempMess.contains("who created you") {
        return "Him"
    }else if tempMess.contains("who are you") {
        return "Who who! Who who"
    }else if tempMess.contains("i really wanna know") {
        return "Who who! Who who!"
    }else if tempMess.contains("what is a screen") {
        return "A screen is a blocking move used offensively. They stand either beside or nbehind a defender, in order to give their teammate enought time and space to shoot, pass or dribble. It can also be called a pick"
    }else if tempMess.contains("what is a pick and roll") {
        return "One player screens a defender, allowing the ball carrying player to dribble inside. then the screening player cuts towards the basket for a pass."
    }else if tempMess.contains("who will win the NBA Finals 2023") {
        return "Who else but Big Spo's Tricky Heatles"
    }else if tempMess.contains("what is your name") {
        return "Rewind Bot 1.0"
    }else if tempMess.contains("what is choice") {
        return "Choice (Basketball Offence, 2021) is a drill involving all 5 players. One stands outside the three-point line in line with the key, two stand in the paint and the other two are on opposite sides of the three-point line. The player at the top (The point Guard) calls either choice one, choice two, four or down. One and two involve the two wing players swapping, one receiving a screen and then the ball from the point guard. 4 involves the two forwards in the paint"
    }else {
        return "Thanks for your question, the helpbot currently does not have an answer for you. Please contact me directly at nkier200@Caledonian.ac.uk"
    }
}
