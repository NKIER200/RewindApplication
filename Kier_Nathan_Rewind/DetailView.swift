//
//  DetailView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct DetailView: View {
    @Binding var chat: DailyChat
    
    @State private var data = DailyChat.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Chat Info")){
                NavigationLink(destination: ContentView(chat: $chat)) {
                    Label("Start Chat", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Duration", systemImage: "clock")
                    Spacer()
                    Text("\(chat.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(chat.theme.name)
                        .padding(4)
                        .foregroundColor(chat.theme.accentColor)
                        .background(chat.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")){
                ForEach(chat.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if chat.history.isEmpty {
                    Label("No Meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(chat.history) { history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
        }
        .navigationTitle(chat.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = chat.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(chat.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                chat.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(chat: .constant(DailyChat.sampleData[0]))
        }
    }
}
