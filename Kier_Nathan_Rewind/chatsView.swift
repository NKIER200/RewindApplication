//
//  chatsView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 14/06/2022.
//

import SwiftUI

struct chatsView: View {
    @Binding var chats: [DailyChat]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewChatView = false
    @State private var newChatData = DailyChat.Data()
    @State var showHome = false
    let saveAction: ()->Void
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isDeviceSettings") private var isDeviceSettings = false
    @AppStorage("isGrayScale") private var isGrayScale = false

    var body: some View {
        
            List {
                ForEach($chats) { $chat in
                    NavigationLink(destination: DetailView(chat: $chat)) {
                        CardView(chat: chat)
                        
                    }
                    .listRowBackground(chat.theme.mainColor)
                }
            }
            .navigationTitle("Chats")
            
            .toolbar{
                NavigationLink(destination: testView() .navigationBarBackButtonHidden(true))  {
                    Label("View Home", systemImage: "house")
                }
                
            }
           
            
          
            
            
            .toolbar{
                NavigationLink(destination: LogView()) {
                    Label("View Account", systemImage: "person")
                }
                
                
            }
            
            
            
            .accessibilityLabel("New Chat")
            .toolbar {
                Button(action: {isPresentingNewChatView = true}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Chat")
            }
            .sheet(isPresented: $isPresentingNewChatView) {
                NavigationView {
                    DetailEditView(data: $newChatData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingNewChatView = false
                                    newChatData = DailyChat.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newChat = DailyChat(data: newChatData)
                                    chats.append(newChat)
                                    isPresentingNewChatView = false
                                    newChatData = DailyChat.Data()
                                }
                            }
                        }
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive { saveAction() }
                }
                Spacer()
                
                
            }
            
        }
    }
    
    struct chatsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                chatsView(chats: .constant(DailyChat.sampleData), saveAction: {})
            
        }
           
    }
    
}

