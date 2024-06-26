//
//  ErrorView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - ErrorView
struct ErrorView: View {
    
    // MARK: Properties
    var error: String
    var closure: (() -> Void)?
    
    #if os(watchOS)
        private let height = WKInterfaceDevice.current().screenBounds.height / 3
        private let width = WKInterfaceDevice.current().screenBounds.width - 16
    #else
        private let height = UIScreen.main.bounds.height / 3
        private let width = UIScreen.main.bounds.width - 16
    #endif
    
    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.6)
            errorContent
        }
        .ignoresSafeArea()
    }
    
    // MARK: SubView
    private var errorContent: some View {
        ZStack {
            Image("marvelCrash")
                .resizable()
                .id(0)
            
            LinearGradient(
                colors: [Color(.black), .clear],
                startPoint: .bottom,
                endPoint: .top
                )
            .id(1)
            
            VStack {
                
                Spacer()
                
                Text("\(error)")
                    .id(2)
                    
                Divider()
                    .frame(height: 3)
                    .overlay(.red)
                    .id(3)
                    
                Button(NSLocalizedString("Close", comment: "")) {
                    closure?()
                }
                .padding(8)
                .background(AppColors().KCorange)
                .cornerRadius(25)
                .opacity(0.9)
                .id(4)
                
            }
            .padding()
            .font(AppFonts().textL)
            .foregroundColor(.red)
            .bold()
            
        }
        .frame(width: width,
               height: height)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

#Preview {
    ErrorView(error: "Test Error")
}

