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
    
    var body: some View {
        VStack {
            TextField("Enter your prompt", text: $inputText).autocorrectionDisabled().padding()
            .border(Color.purple)
            
            AsyncButton {
//                isLoading = true
//                responseText = await aiService.getAIResponse(prompt: inputText)
//                isLoading = false
//            } label: {
//                Text("Ask Alora").padding().background(isLoading ? Color.gray : Color.blue).foregroundStyle(.white).cornerRadius(8)
                await MainActor.run { isLoading = true }
                   let response = await aiService.getAIResponse(prompt: inputText)
                   await MainActor.run {
                       responseText = response
                       isLoading = false
                   }
               } label: {
                   Text("Ask Alora")
                       .padding()
                       .background(isLoading ? Color.gray : Color.blue)
                       .foregroundStyle(.white)
                       .cornerRadius(8)
            }
            
            VStack {
                ProgressView().opacity(isLoading ? 1 : 0)
                ScrollView {
                    Text(responseText).opacity(isLoading ? 0.5 : 1)
                }
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
