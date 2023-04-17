//
//  CardView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct CardView: View {
    let chat: DailyChat
    var body: some View {
        VStack(alignment: .leading) {
            Text(chat.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(chat.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(chat.attendees.count) attendees")
                Spacer()
                Label("\(chat.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(chat.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(chat.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var chat = DailyChat.sampleData[0]
    static var previews: some View {
        CardView(chat:chat)
            .background(chat.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
