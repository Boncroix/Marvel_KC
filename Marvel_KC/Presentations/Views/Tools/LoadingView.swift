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
    @State var rotationAngle: Double = 0
    @State var textOpacity: Double = 1.0
    @State var timer: Timer?
    
    #if os(watchOS)
        private let width = WKInterfaceDevice.current().screenBounds.width / 2.5
    #else
        private let width = UIScreen.main.bounds.width / 2.5
    #endif

    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.4)
                .id(0)
            loadingSubView
                .id(1)
        }
    }
    
    // MARK: SubViews
    var loadingSubView: some View {
        VStack(spacing: 0) {
            Image("LKC")
                .resizable()
                .frame(width: width,
                       height: width)
                .rotationEffect(.degrees(rotationAngle))
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
                .animation(.easeInOut(duration: 0.2), value: rotationAngle)
                .id(2)

            Text(NSLocalizedString("Loading...", comment: ""))
                .font(AppFonts().textL)
                .opacity(textOpacity)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1)
                        .repeatForever(autoreverses: true)) {
                        self.textOpacity = 0.0
                    }
                }
                .id(3)
        }
    }
    
    // MARK: Private Funtions
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.rotationAngle += 22.5
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

// MARK: - Preview
#Preview {
    LoadingView()
}
