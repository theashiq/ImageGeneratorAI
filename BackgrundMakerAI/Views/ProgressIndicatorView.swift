//
//  ProgressIndicatorView.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//


import SwiftUI

struct ProgressIndicatorView: View {
    let text: String
    var body: some View {
        ProgressView(text).foregroundColor(.accentColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .all)
            .background(Color.black.opacity(0.3))
    }
}