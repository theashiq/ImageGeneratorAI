//
//  PromptInputViewModel.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

import Foundation
import SwiftUI


class PromptInputViewModel: ObservableObject {
    @Published var prompt: Binding<InputPrompt>
    
    @Published var context: String
    @Published var theme: Theme
    @Published var excludedWordInput: String = ""
    @Published var excludedWords: Set<String>
    @Published var outputImageWidth: Int
    @Published var outputImageHeight: Int
    
    private static func breakExcludedWords(words: String) -> Set<String> {
        Set(words.components(separatedBy: ",").filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).count > 2 })
    }
    
    init(prompt: Binding<InputPrompt>) {
        self.prompt = prompt
        
        self.context = prompt.context.wrappedValue
        self.theme = prompt.theme.wrappedValue
        self.excludedWords = PromptInputViewModel.breakExcludedWords(words: prompt.excludedWords.wrappedValue)
        self.outputImageWidth = prompt.outputImageWidth.wrappedValue
        self.outputImageHeight = prompt.outputImageHeight.wrappedValue
    }
    
    func submit() {
        prompt.wrappedValue = InputPrompt(
            context: self.context,
            theme: self.theme,
            excludedWords: self.excludedWords.joined(separator: ","),
            outputImageWidth: self.outputImageWidth,
            outputImageHeight: self.outputImageHeight
        )
    }
    
    func addExcludedWord() {
        let trimmedInput = excludedWordInput.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedInput.count > 2 {
            
            if !excludedWords.contains(where: { $0.lowercased() ==  trimmedInput.lowercased() }) {
                excludedWords.insert(trimmedInput)
                excludedWordInput = ""
            }
        }
    }
    func removeExcludedWord(word: String) {
        excludedWords.remove(word.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
