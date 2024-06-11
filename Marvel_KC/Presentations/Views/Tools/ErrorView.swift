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
    @Environment(\.colorScheme) var colorScheme
    var error: String
    var closure: (() -> Void)?
    
    #if os(watchOS)
        private let height = UIScreen.main.bounds.height/2
    #else
        private let height = UIScreen.main.bounds.height/3
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
            Image(.marvelCrash)
                .resizable()
            
            LinearGradient(
                colors: [AppColors(colorScheme: colorScheme).whiteBlack, .clear],
                startPoint: .bottom,
                endPoint: .top
                )
            
            VStack {
                
                Spacer()
                
                Text("\(error)")
                    
                Divider()
                    .frame(height: 3)
                    .overlay(.red)
                    
                Button(NSLocalizedString("Close", comment: "")) {
                    closure?()
                }
                .padding(8)
                .background(AppColors().KCorange)
                .cornerRadius(50)
                .opacity(0.9)
                
            }
            .padding()
            .font(AppFonts().textL)
            .foregroundColor(.red)
            .bold()
            
        }
        .frame(width: UIScreen.main.bounds.width-16,
               height: height)
        .cornerRadius(50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(AppColors(colorScheme: colorScheme).whiteBlack, lineWidth: 2)
        )
    }
}

#Preview {
    ErrorView(error: "Test Error")
}

