//
//  RequestBuilder.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


import Foundation

class RequestBuilder {
    private var apiKey: String {
        "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"
    }
    
    func builderRequest(prompt: String, url:URL?) -> URLRequest?{
        
        guard let apiUrl = url else {return nil}
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "model" : "gpt-4o-mini",
            "message": [
                ["role": "user", "content": prompt]
            ]
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            return nil
        }
        request.httpBody = jsonData
        return request
    }
}
