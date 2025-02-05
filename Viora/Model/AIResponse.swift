//
//  AIResponse.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


struct AIResponse: Decodable {
    struct Choice: Decodable {
        struct Message: Decodable {
            let content: String
        }
        let message: Message
    }
    
    let choices: [Choice]
    
    func getFirstResponse() -> String {
        return choices.first?.message.content ?? "No response from AI."
    }
}
