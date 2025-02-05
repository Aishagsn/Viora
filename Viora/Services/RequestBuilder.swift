//
//  RequestBuilder.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


import Foundation

class RequestBuilder {
    private var apiKey: String {
        "AIzaSyC8ScATYbAPnKn68iEdRGn3L7xGn9EBv-I"
    }
    func builderRequest(prompt: String, url: URL?, apiKey: String) -> URLRequest? {
        guard let apiUrl = url else { return nil }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "model": "gemini-1.5-flash",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Request Body: \(jsonString)")
            }
        } catch {
            print("JSON serialization error: \(error.localizedDescription)")
            return nil
        }
        return request
    }
}
