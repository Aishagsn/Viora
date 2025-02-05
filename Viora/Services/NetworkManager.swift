//
//  NetworkManager.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//
//
//
//import Foundation
//
//class NetworkManager {
//    func sendRequest(_ request: URLRequest) async throws -> Data {
//        let (responseData, _) = try await URLSession.shared.data(for: request)
//        return responseData
//    }
//}
import Foundation

class NetworkManager {
    func sendRequest(_ request: URLRequest) async throws -> Data {
        let (responseData, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
            return responseData
        } else {
            if let httpResponse = response as? HTTPURLResponse {
                throw URLError(.badServerResponse, userInfo: ["statusCode": httpResponse.statusCode])
            } else {
                throw URLError(.unknown)
            }
        }
    }
}
