//
//  ContentView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @Binding var chat: DailyChat
    @StateObject var chatTimer = ChatTimer()
    @StateObject var speechRecog = SpeechRecognizer()
    @State private var isRecording = false
    
    private var player: AVPlayer {AVPlayer.sharedDingPlayer}
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(chat.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: chatTimer.secondsElapsed, secondsRemaining: chatTimer.secondsRemaining, theme: chat.theme)
                ClockView(speakers: chatTimer.speakers, isRecording: isRecording, theme: chat.theme)
                MeetingFooterView(speakers: chatTimer.speakers, skipAction: chatTimer.skipSpeaker)
            }
            .padding()
            .foregroundColor(chat.theme.accentColor)
            .onAppear {
                chatTimer.reset(lengthInMinutes: chat.lengthInMinutes, attendees: chat.attendees)
                chatTimer.startChat()
                chatTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                    player.play()
                }
                speechRecog.reset()
                speechRecog.transcribe()
                isRecording = true
                chatTimer.startChat()
            }
            .onDisappear {
                chatTimer.stopChat()
                speechRecog.stopTranscribing()
                isRecording = false
                let newHistory = History(attendees: chat.attendees ,lengthInMinutes: chat.timer.secondsElapsed / 60, transcript: speechRecog.transcript)
                chat.history.insert(newHistory, at: 0)
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(chat: .constant(DailyChat.sampleData[0]))
    }
}
