//
//  APIcontentView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 13/12/2022.
//

import SwiftUI
import OpenAISwift


final class ViewModel: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
        
    }
    
    
    func send(text: String,
              completion: @escaping (String)-> Void) {
        client?.sendCompletion(with: text,
                               maxTokens: 500,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure:
                break
                
            }
        })
        
    }
}



struct APIcontentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(models, id: \.self) {string in
                    Text(string)
                }
                
                Spacer()
                
                HStack {
                    TextField("Type something you wish for help with", text: $text)
                    Button("send") {
                        send()
                    }
                    
                }
                
            }
        }
        
        .onAppear{
            viewModel.setup()
        }
        .padding()
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty  else {
            return
        }
        models.append("Me: \(text)")
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("ChatGPT: "+response)
                self.text = ""
            }
        }
        
    }
}


struct APIcontentView_Previews: PreviewProvider {
    static var previews: some View {
        APIcontentView()
    }
}
