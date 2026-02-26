//
//  InputPrompt.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

import Foundation


struct InputPrompt {
    var expression: String {
        "Generate a \(theme) background image based on the following context: \"\(context)\" to use beneath any \(theme.complement) text."
    }
    var context: String
    var theme: Theme
    var excludedWords: String
    var outputImageWidth: Int
    var outputImageHeight: Int
    
    static var empty: InputPrompt {
        InputPrompt(context: "Abstract", theme: .light, excludedWords: "", outputImageWidth: 512, outputImageHeight: 512)
    }
    
    var isEmpty: Bool {
        context.trimmingCharacters(in: .whitespacesAndNewlines).count == 0
    }
}

enum Theme: String, CaseIterable, Identifiable {
    case light = "light"
    case dark = "dark"
    
    var id: Self { self }
    
    var complement: Theme {
        switch self {
        case .light: .dark
        case .dark: .light
        }
    }
    var foregroundText: Theme {
        switch self {
        case .light: .dark
        case .dark: .light
        }
    }
}
