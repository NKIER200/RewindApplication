//
//  formView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 09/07/2022.
//

import SwiftUI

struct formView: View {
    
    @StateObject var manager = LoginFormManager()
    @State private var hasER: Bool = false
    
    let successfullyFilled: (_ data: [FormSN])-> Void
    
    var body: some View {
        ZStack{
           
            Form {
                ForEach($manager.sections) { $section in
                    Section {
                        
                        ForEach($section.items) { $item in
                            
                            switch item.kind {
                            case .text(let config):
                                TextField(config.title, text: $item.stringVal)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                            case .button(let config, let action):
                                Button {
                                    action(config.triggerAction)
                                } label: {
                                    Text(config.title)
                                }
                            case .toggle(let config):
                                Toggle(config.title, isOn:$item.boolVal)
                            case .secureText(let config) :
                                SecureField(config.title, text: $item.stringVal)
                                    .textContentType(config.textContentType)
                                    .keyboardType(config.keyboardInputType)
                                
                            }
                        }
                        
                    } header: {
                        if let headerT = section.header {
                            Text(headerT)
                        }
                        
                    } footer: {
                        if let footerT = section.footer {
                            Text(footerT)
                        }
                    }
                }
            }
        }
        .onAppear(perform: manager.load)
        .onChange(of: manager.formState) { state in
            switch state {
            case .invalid:
                hasER = true
                case .valid:
                successfullyFilled(manager.sections)
            default: break
                
            }
        }
        .alert("You've fucked up my app", isPresented: $hasER) {
            Button(role: .cancel) {
                manager.formState = .na
                
            } label: {
                Text("Cancel")
            }
        } message: {
            Text("Youve forgotten to fill out ALL of the fields")
        }
    }
}

struct formView_Previews: PreviewProvider {
    static var previews: some View {
        formView { _ in}
    }
}
