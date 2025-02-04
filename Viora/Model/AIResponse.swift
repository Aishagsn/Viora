//
//  AIResponse.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


struct AIResponse: Codable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let choices: [Choice]
    
}
