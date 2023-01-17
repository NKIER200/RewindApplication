//
//  APICall.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 13/12/2022.
// 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

import Foundation
import OpenAISwift

final class APICall {
    static let shared = APICall()
    
    @frozen enum Constants {
        static let key = "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"
    }
    
    private var client: OpenAISwift?
    
    private init() {}
    
    public func setup() {
        let client = OpenAISwift(authToken: Constants.key)
    }
    
    public func getResponse(input: String,
                            completion: @escaping (Result<String, Error>)-> Void) {
        client?.sendCompletion(with: input, completionHandler: {result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(.success(output))
            case .failure(let error):
                completion(.failure(error))
            }
            
        })
    }
}
