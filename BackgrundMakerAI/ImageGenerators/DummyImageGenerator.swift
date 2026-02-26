//
//  DummyImageGenerator.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

final class DummyImageGenerator: ImageGeneratorProtocol {
    func generateImage(from input: InputPrompt) async throws -> GeneratedImage {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return .init(url: Self.dummyImageUrls.randomElement()!)
    }
    
    private static var dummyImageUrls: [String] = [
        "https://static.greatbigcanvas.com/images/square/panoramic-images/44617.jpg?max=800",
        "https://i.pinimg.com/474x/0f/96/c3/0f96c3e37324605eb293df171c41d9f7.jpg",
        "https://captainkimo.s3.amazonaws.com/wp-content/uploads/2016/09/22211618/Pine-Glades-Wetlands-Natural-Area-Sunset-Square.jpg"
    ]
}
