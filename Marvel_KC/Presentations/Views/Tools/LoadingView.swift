//
//  LoadingView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI

// MARK: - LoadingView
struct LoadingView: View {
    
    // MARK: Properties
    @State private var rotationAngle: Double = 0
    @State private var textOpacity: Double = 1.0
    @State private var timer: Timer?

    // MARK: View
    var body: some View {
        ZStack {
            Image(.backgound)
                .resizable()
                .ignoresSafeArea()
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

                Text("Loading...")
                    .font(.headline)
                    .opacity(textOpacity)
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.textOpacity = 0.0
                    }
            }
        }
    }
    
    // MARK: Funtions
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
