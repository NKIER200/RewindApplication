//
//  ChatStore.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/06/2022.
//

import Foundation
import SwiftUI

class ChatStore: ObservableObject {
    @Published var chats: [DailyChat] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    static func load() async throws -> [DailyChat] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let chats):
                    continuation.resume(returning: chats)
                }
            }
        }
    }
    static func load(completion: @escaping (Result<[DailyChat], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else{
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyChats = try JSONDecoder().decode([DailyChat].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyChats))
                }
            }catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    @discardableResult
    static func save(chats: [DailyChat]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(chats: chats) { result in
                switch result {
                case.failure(let error):
                    continuation.resume(throwing: error)
                case.success(let chatsSaved):
                    continuation.resume(returning: chatsSaved)
                }
            }
        }
    }
    
    static func save(chats: [DailyChat], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(chats)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(chats.count))
                }
            } catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
