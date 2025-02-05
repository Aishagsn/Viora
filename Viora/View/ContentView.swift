//
//  ContentView.swift
//  Viora
//
//  Created by Aisha on 04.02.25.
//


import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var responseText: String = ""
    @State private var isLoading: Bool = false
    
    let aiService = AIService()
    let apiKey = "AIzaSyC8ScATYbAPnKn68iEdRGn3L7xGn9EBv-I"
    
    var body: some View {
        VStack {
            TextField("Enter your question...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                Task {
                    await fetchAIResponse()
                }
            }) {
                Text("Ask Viora")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isLoading ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(isLoading)
            .padding()
            
            VStack {
                if isLoading {
                    ProgressView()
                        .padding()
                }
                
                ScrollView {
                    Text(responseText)
                        .padding()
                        .opacity(isLoading ? 0.5 : 1)
                }
                .frame(maxHeight: isLoading ? 100 : .infinity)
            }
            .padding()
        }
        .padding()
    }
    
    private func fetchAIResponse() async {
        isLoading = true
        responseText = await aiService.getAIResponse(prompt: inputText, apiKey: apiKey)
        isLoading = false
    }
}

//#Preview {
//    ContentView()
