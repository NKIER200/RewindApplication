//
//  MeetingFooterView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ChatTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted }) else  { return nil }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted}
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Final Speaker")
                } else {
                    Text(speakerText)
                Spacer()
                Button(action: skipAction) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next User")
            }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyChat.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
