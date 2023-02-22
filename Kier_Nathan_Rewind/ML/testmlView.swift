//
//  testmlView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 11/02/2023.
//

import SwiftUI
import CoreML

struct testmlView: View {
    @State private var inputText = ""

    let model = intentClassifierversion1_0()

    var body: some View {
        VStack {
            Text("Help Function")
                .font(.title)
                .foregroundColor(Color.red)
            Image(systemName: "clock.circle.fill")
                .font(.system(size: 30))
                .foregroundColor(Color.red)
            Text("Using intent classifier")
                .font(.subheadline)
                .foregroundColor(Color.red)

            TextField("Enter Word or phrase", text: $inputText)
                .padding()
                .background(Color(.red))
                .foregroundColor(Color.black)
                .cornerRadius(10)
                .padding()
            

            Button(action: {
                guard let intent = classifyIntent(input: self.inputText) else {
                    return
                }

                let response = generateResponse(for: intent)

                self.showResponse(response)
            }) {
                Text("try")
                    .padding()
                    .background(Color(.red))
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                    .padding()

            }
        }
    }

    private func classifyIntent(input: String) -> String? {
        guard let inputFeatures = try? intentClassifierversion1_0Input(text: input) else {
            return nil
        }

        guard let prediction = try? model.prediction(input: inputFeatures) else {
            return nil
        }

        return prediction.label
    }

    private func generateResponse(for intent: String) -> String {
        switch intent {
        case "greetings":
            return "hey, use a word or phrase available in the model for help."
        case "position1":
            return "The Point Guard, the PG. Your ball carrier. The most important position on offence. calls on court offensive plays. Notable PGs include: Russell Westbrook, Dame Lillard, LeBron James (Cavs), Kyrie Irving, Luka Doncic, Magic Johnson and the list could go on all day"
        case "position2":
            return "The Shooting Guard. Your first wing player. Can be a knockdown 0 dribble shooter like Klay, or a dribbling, playmaking sharpshooter like Steph. Either way, a versatile offensive option. Able to change a games outcome. Notables include: MJ, Steph, DWade, Klay, Herro, DeRozan, PG13, Kobe, Reggie Miller, Ray Allen (BANG) and the list goes on."
        case "position3":
            return "The Small Forward. also known as the 3 or as the swingman. shorter, quicker and fitter than Power Forwards and Centers. However, taller and stronger than the guards. Small Forwards have to possess all around great attributes. High scoring percentages both in the paint and beyond the arc. Notable players include: LeBron (Again, what can't he do), KD, Kawhi, Larry Bird, PG13, Elgin Baylor, Jimmy F Butler, TMac and many many more."
        case "position4":
            return "The Power Forward. AKA PF or the 4. Taller and stronger than a SF, but less agile. Responsible for scoring inside the paint more than outside. Rebounding is a big part of their game. Notable players include: Tim Duncan, KG, Dirk, LeBron (again), Giannis 'The Greek Freak' Antetokounmpo, Charles Barkley, Bob Petit, Zion, AD, McHale, Pau, Chris Bosh, Rodman, Webber, Draymond and many more."
        case "position5":
            return "The Center. Usually the tallest player on the team, unless its the 2018 Rockets. On offense its the centers job to score close shots and to rebound. On defence thouggh, they must block the opponents shots and rebound the misses. Notable players include Kareem Abdul-jabbar, Shaq, Hakeem, Bill Russell, Moses Malone, Wilt, LeBron in the 2021/22 season, Patrick Ewing, Dikembe Mutumbo, Zo, David Robinson and many more."
        case "rules":
            return "these are rules of the sport"
        case "tip":
            return "the start of a game"
        case "shoe1":
            return "Kyrie has an incredible line of shoes with Nike. the Most recent being the Infinity. However, due to recent anti-semitisim he was dropped by the company and his shoes discontinued. Only anti-semites wear Kyries now"
        case "shoe2":
            return "Lebron James, The King, King James, Him James, The Goat, The Alltime scorer has had many shoes with Nike. The most recent being the LeBron 20. The shoes technology may have changed since his first personal shoe but LeBron is the same old goat."
        case "block":
            return "The art of blocking an attackers shot. This can be blocking a layup, like LeBrons famous Game 7 block on Iggy. Or blocking a jumpshot, like Zions in college."
        case "shoe3":
            return "The Luka 1. Luka Doncic's first signature shoe since joining the NBA. A great shoe for guards and forwards, as they offer great ankle support."
        case "shoe4":
            return "The Shoeline of Giannis. The most recent is the Zoom Freak 4 but the Zoom Freak 3 and 2 still hold up very well. Very affordable for most hoopers. Offer great traction, support and are lightweight. Making them perfect for guards and small forwards."
        case "shooting":
            return "Shooting is a massive part of a players game. Important for all positions. From a close shot to a deep 3 point shot. If you require help with shooting, check out the video section of the application."
        case "2pointshooting":
            return "A mid range shot is a game changer for guards.  Being able to make a contested or open Middy can push a player to new levels. Just look at Ja Morant. if he he could make one to save his life maybe the Grizzlies would have made it to the Western Conference Finals. Players to watch and learn from include Kyrie, DeRozan, Curry, Himmy Butler and many more. Check out Kyries video in the video section for help."
        case "3pointshooting":
            return "3 point shot has changed the game of basketball. All thanks to Steph Curry. Now we have 10 year olds shooting as soon as they cross half court so they can shout bang like Mike Breen does when a deep shot is made. Curry now leads the league in 3 point shots made all time. The Warriors were able to create a dynasty from his and Klay Thomsons shooting. Klay once had 37 points in one quarter with 8 dribbles. Having a player on your team who can knock a 3 down no matter what is a must. At any level. To become that player, check out the video section."
        case "dame":
            return "It's Dame Time. Dame calls game a lot. Like that shot to send the Thunder Home. Never count Portland out if Dame is on the court."
        case "LeBron":
            return "LeBron James is the GOAT. The All Time Record Scorer. Beat the Warriors who were 73-9 and 3-1 up in the series. Never before has this happened in the Finals. 4 NBA Championships, 4 FMVPS, 4 MVPS, 19 time All star, 13 time All-NBA first team, 3 time All-NBA second team, 2 time All-NBA third team, 5 time NBA All-defensive first team, NBA All-defensive second team, ROTY, All-Rookie first team, 1 scoring title, 1 assists title, 2 Olympic Gold Medals, 1 Olympic Bronz medal, World Cup Bronze medal, Americas Championship Gold medal."
        case "NBA":
            return "The highest level of basketball in the world. The National Basketball Assoiciation. Founded June 6th 1948 in New York. When the NBL and BAA merged."
        case "dunk":
            return "The art of throwing it down. Accomplished when a player uses their hand to put the ball in the basket from above the rim. Their hand must make contact with the rim for it to be considered a dunk."
        case "rebound":
            return "The place where games are won or lost. Rebounding is a vital part of a teams game. On offence it allows the team another attack, either by going for a shot themselves or by passing to another player. On the defensive end, it allows the team to fastbreak, which tends to result in points more often than not."
        case "dribbling":
            return "Dribbling is an essential part of the game. used to progress the ball up the court and into scoring opportunities."
        case "dribhelp":
            return "For help with dribbling please see the video section."
        case "shohelp":
            return "for help with shooting, please see the video section."
        case "pashelp":
            return "for help with passing, please see the video section."
        case "foul1":
            return "A player can have up to 5 personal fouls. They are ejected upon the 5th."
        case "foul2":
            return "A shooting foul is when a player is fouled while in a shooting motion. If they miss they receive 2 free throws or 3 free throws if it is a 3 point shot. If they make it they receive one free throw, for a chance at a 3 or 4 point play."
        case "flafoul":
            return "A flagrant foul. Similar to a yellow card in football. Two flagrant 1s results in the immediate ejection of a player. whereas a Flagrant 2 results in immediate ejection."
        case "ejection":
            return "A player is removed from the game and cannot return."
        case "tech":
            return "A tech is given for unsportsman like conduct. such as taunting an opponent, arguing with an official or sometimes even for nothing at all."
        case "clock":
            return "The shot clock. Teams have 24 seconds once receving the ball to shoot. clock is reset to 14 seconds if the ball hits the rim."
        case "mikebreenspecial":
            return "BANG!! SHouted by Mike Breen when a player makes either a hugely important 3 pointer, a very deep shot, or a buzzer beater. Sometimes all three combined."
        case "inbound":
            return "When the ball is passed into play."
        case "gameclock":
            return "The clock that shows how much time remains in the game. This stops during free throws, fouls, inbounds and timeouts"
        case "sub":
            return "When a player is substituted from the game. Subs can happen at any time."
        case "steal":
            return "When the ball is stolen by a defender and the ball switches possesion to the other team"
        case "jumperpopsout":
            return "A Jumpshot that has popped out after nearly going in"
        case "Euroleague":
            return "The highest level of European basketball"
        case "postup":
            return "Posting up in the paint"
        case "drive":
            return "Driving inside to the basket. Usually ends in a layup or dunk"
        case "shortjumperinlane":
            return "A short jumpshot taken not far from the basket."
        case "layup":
            return "A layup"
        case "jumpermissoffbackrim":
            return "Jumpshot that misses after hitting the back of the rim."
        case "jumpermissoffsiderim":
            return "Jumpshot that misses after hitting the side of the rim."
        case "bankshot":
            return "A shot that goes in after hitting the backboard/glass from an angle. Usually hitting thw box first."
        case "basketcut":
            return "Cutting to the basket for a lyup or shortjumper"
        case "pass":
            return "Passing the ball"
        case "sideline":
            return "a type of sideline"
        case "corner":
            return "A type of corner"
        case "lane":
            return "A name for the Lane."
        case "elbow":
            return "One of the elbows"
        case "centeroffreethrowline":
            return "The center of the freethrow line."
        case "topofthearc":
            return "The top of the arc"
        case "therim":
            return "Another word for the rim"
        case "halfcourtline":
            return "Another name for the halfcourt line"
        case "needastop":
            return "A way to say that a team needs a stop on defence. Either a close game, during a scoring run from the opposition or late in game."
        case "playingD":
            return "A term to describe a player playing defence"
        case "forcedindirection":
            return "A player was forced in a direction to stop them scoring"
        case "tiegame":
            return "The games score is tied. Could be heading to Overtime depending on when."
        case "travel":
            return "A term for travelling. Where a player takes more than two steps between or after dribbling. could also being moving their pivot foot."
        case "foul":
            return "A generic term for a generic foul. not necessarily a shooting foul."
        default:
            return "I'm sorry, this input is not accounted for in the model."
        }
    }

    private func showResponse(_ response: String) {
        let alert = UIAlertController(title: "models Response", message: response, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "end", style: .default, handler: nil))

        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

struct testmlviewView_Previews: PreviewProvider {
    static var previews: some View {
        testmlView()
    }
}
