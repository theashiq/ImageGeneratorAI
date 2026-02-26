//
//  LandingView.swift
//  BackgrundMakerAI
//
//  Created by Ashiqur Rahman on 26/2/26.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel: LandingViewModel = LandingViewModel(imageGenerator: StabilityAIImageGenerator())
    @State var isAlertPresented: Bool = false
    @State var isInputViewPresented: Bool = false
    @State var animateInputButtonIndicator: Bool = false
    @State var quote: String = "Hello, World!"
    @State var quoteInputViewPresented = false
    
    var body: some View {
        VStack {
            Text("AI Background Generator")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundColor(.accentColor)
                .padding()
            
            Spacer()
            outputSection
            Spacer()
            inputButton
        }
        .onChange(of: viewModel.alert) {
            if viewModel.alert != .none {
                isAlertPresented.toggle()
            }
        }
        .sheet(isPresented: $quoteInputViewPresented) {
            QuoteInputView(quote: $quote)
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isInputViewPresented) {
            PromptInputView(viewModel: PromptInputViewModel(prompt: $viewModel.prompt))
                .presentationDetents([.medium, .fraction(0.95)])
        }
        .alert(viewModel.alert?.title ?? "", isPresented: $isAlertPresented) {
            Button("Ok", role: .cancel) {
                viewModel.alert = nil
            }
        } message: {
            Text(viewModel.alert?.message ?? "")
        }
    }
    
    private var outputSection: some View {
        ZStack {
            AsyncImage(
                url: URL(string: viewModel.imageUrl),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .overlay(alignment: .topTrailing) {
                            HStack {
                                ShareLink("Share", item: image, preview: SharePreview(viewModel.prompt.expression, image: image))
                                regenerateButton
                            }
                            .padding()
                        }
                },
                placeholder: {
                    Rectangle()
                        .fill(.clear)
                        .overlay {
                            if !viewModel.imageUrl.isEmpty {
                                ProgressIndicatorView(text: "Loading")
                            }
                        }
                }
            )
            .padding(5)
            .opacity(viewModel.isGeneratingImage ? 0.2 : 1)
            .overlay {
                Text(quote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(viewModel.prompt.theme.foregroundTextColor)
                    .overlay(alignment: quote.isEmpty ? .center : .topTrailing) {
                        Button {
                            quoteInputViewPresented = true
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .clipShape(Circle())
                        }
                        .offset(x: quote.isEmpty ? 0 : 15, y: quote.isEmpty ? 0 : -15)
                    }
            }
            
            if viewModel.isGeneratingImage {
                ProgressIndicatorView(text: "Processing")
            }
        }
        .frame(minHeight: 512, maxHeight: 1024)
    }
    
    private var inputButton: some View {
        Button {
            isInputViewPresented = true
        } label: {
            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 30, weight: .bold))
        }
        .disabled(viewModel.isGeneratingImage)
        .overlay {
            if viewModel.showEmptyPromptSign {
                inputButtonIndicator
                    .onAppear {
                        animateInputButtonIndicator = viewModel.showEmptyPromptSign
                    }
            }
        }
        .padding()
    }
    
    private var regenerateButton: some View {
        Button(action: viewModel.regenerateImage) {
            Image(systemName: "arrow.clockwise.circle")
                .font(.system(size: 20, weight: .regular))
        }
        .disabled(viewModel.isGeneratingImage)
    }
    
    private var inputButtonIndicator: some View {
        Image(systemName: "arrowshape.right.fill")
            .rotationEffect(Angle(degrees: 90))
            .scaleEffect(animateInputButtonIndicator ? 1.1 : 1)
            .foregroundColor(animateInputButtonIndicator ? .accentColor: .accentColor.opacity(0.5))
            .offset(y: animateInputButtonIndicator ? -40 : -50)
            .animation(.easeInOut(duration: 1).repeatForever(), value: animateInputButtonIndicator)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

extension Theme {
    var foregroundTextColor: Color {
        switch self {
        case .light: .black
        case .dark: .white
        }
    }
}
