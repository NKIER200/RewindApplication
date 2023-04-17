//
//  ClockView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 20/06/2022.
//

import SwiftUI

struct ClockView: View {
    let speakers: [ChatTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted})?.name ?? "someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack{
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is chatting")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription active" : "without transcription active")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id}) {
                        ArcForClock(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct ClockView_Previews: PreviewProvider {
    static var speakers: [ChatTimer.Speaker] {
        [ChatTimer.Speaker(name: "Bob", isCompleted: true), ChatTimer.Speaker(name: "Joe", isCompleted: false)]
    }
    static var previews: some View {
        ClockView(speakers: speakers, isRecording: true, theme: .bubblegum)
    }
}
