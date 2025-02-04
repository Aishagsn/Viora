//
//  Choice.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


struct Choice: Codable {
    let index: Int
    let message: Message
    let logprobs: String?
    let finish_reason: String
}

struct Message: Codable {
    let role: String
    let content: String
}
