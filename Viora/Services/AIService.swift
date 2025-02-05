//
//  AIService.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


import Foundation

class AIService {
    private let networkManager = NetworkManager()
    private let requestBuilder = RequestBuilder()
    private let errorMessage = " Error: Unable to generate AI response"
    private let url = URL( string:
                            
                            "https://generativelanguage.googleapis.com/v1beta/openai/chat/completions"
    )
    
    func getAIResponse(prompt: String, apiKey: String) async -> String {
        guard let request = requestBuilder.builderRequest(prompt: prompt, url: url, apiKey: apiKey) else {
            print("[Error] Failed to build request")
            return "Request building failed"
        }
        
        do {
            let data = try await networkManager.sendRequest(request)
            return decodeResponse(data)
        } catch let error as URLError {
            if let statusCode = error.userInfo["statusCode"] as? Int {
                print("[Error] API returned status code: \(statusCode)")
            }
            print("[Error] Failed to send request: \(error.localizedDescription)")
            return "Failed to get response"
        } catch {
            print("[Error] Unexpected error: \(error.localizedDescription)")
            return "Failed to get response"
        }
        
    }
    
    func decodeResponse(_ data: Data) -> String {
        do {
            let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
            return aiResponse.getFirstResponse()
        } catch {
            print("[Error] Failed to decode response: \(error.localizedDescription)")
            return "Decoding error: Unable to process response."
        }
    }
}
   
