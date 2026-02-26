//
//  QuoteInputView.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

import SwiftUI

struct QuoteInputView: View {
    @Binding var quote: String
    @FocusState private var isFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Enter Quote").padding()
                
            Form {
                Section {
                    TextEditor(text: $quote)
                        .focused($isFocused)
                        .frame(height: 150)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isFocused = true
                            }
                        }
                }
            }
        }
        .overlay(alignment: .topTrailing) {
            Button("Ok") {
                isFocused = false
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}
