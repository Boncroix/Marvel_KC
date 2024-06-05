//
//  LoadingView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - LoadingView
struct LoadingView: View {
    
    // MARK: Properties
    @State private var rotationAngle: Double = 0
    @State private var textOpacity: Double = 1.0
    @State private var timer: Timer?
    @Environment(\.colorScheme) var colorScheme

    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.4)
            loadingSubView
        }
    }
    
    // MARK: SubViews
    private var loadingSubView: some View {
        VStack {
            Image(.LKC)
                .resizable()
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(rotationAngle))
                .animation(.easeInOut(duration: 0.2), value: rotationAngle)
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }

            Text(NSLocalizedString("Loading...", comment: ""))
                .font(AppFonts().textXL)
                .opacity(textOpacity)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    self.textOpacity = 0.0
                }
        }
    }
    
    // MARK: Private Funtions
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.rotationAngle += 22.5
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

// MARK: - Preview
#Preview {
    LoadingView()
}
