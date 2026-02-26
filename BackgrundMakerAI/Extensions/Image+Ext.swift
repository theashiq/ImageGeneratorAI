//
//  Image+Ext.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

import SwiftUI

extension Image {
    @MainActor
    func getUIImage(newSize: CGSize) -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .frame(width: newSize.width, height: newSize.height)
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
}
