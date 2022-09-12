//
//  botView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 05/07/2022.
//

import SwiftUI

struct botView: View {
    @State private var messageText = ""
    @State private var messages: [String] = ["Welcome to Rewind Help Bot 1.0"]
    var body: some View {
        VStack {
            HStack {
                Text("Rewind")
                    .font(.largeTitle)
                    .italic()
                Image(systemName: "clock.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color.red)
            }
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "" )
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.red.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
            HStack {
                TextField("Type something you wish for help with", text: $messageText)
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(9)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                Button {
                    sendMessage(message: messageText)
                } label : {
                    Image(systemName: "plus")
                }
                .font(.system(size: 30))
                .foregroundColor(Color.red)
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    func sendMessage(message: String) {
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct botView_Previews: PreviewProvider {
    static var previews: some View {
        botView()
    }
}
