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

    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.4)
            loadingSubView
        }
    }
    
    // MARK: SubViews
    private var loadingSubView: some View {
        VStack(spacing: 0) {
            Image("LKC")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2.5,
                       height: UIScreen.main.bounds.width / 2.5)
                .rotationEffect(.degrees(rotationAngle))
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
                .animation(.easeInOut(duration: 0.2), value: rotationAngle)

            Text(NSLocalizedString("Loading...", comment: ""))
                .font(AppFonts().textL)
                .opacity(textOpacity)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1)
                        .repeatForever(autoreverses: true)) {
                        self.textOpacity = 0.0
                    }
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
