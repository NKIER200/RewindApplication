//
//  HistoryView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 25/06/2022.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("transcript")
                    Text(transcript)
                        .font(.headline)
                        .padding(.top)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name})
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
    History(attendees: [DailyChat.Attendee(name: "Bob"), DailyChat.Attendee(name: "Bobby"), DailyChat.Attendee(name: "Tobby")], lengthInMinutes: 10, transcript: "Jimmy Butler is the greatest Basketball player of all time.")
}
                        

    static var previews: some View {
        HistoryView(history: history)
    }
}
