//
//  NetworkManager.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


import Foundation

class NetworkManager {
    func sendRequest(_ request: URLRequest) async throws -> Data {
        let (responseData, _) = try await URLSession.shared.data(for: request)
        return responseData
    }
}
