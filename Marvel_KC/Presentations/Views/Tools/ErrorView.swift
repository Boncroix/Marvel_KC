//
//  ErrorView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI
import MarvelAppLibrary

struct ErrorView: View {
    
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    var error: String
    var closure: (() -> Void)?
    #if os(watchOS)
        private let height = UIScreen.main.bounds.height-16
    #else
        private let height = UIScreen.main.bounds.height/3
    #endif
    
    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView()
            errorContent
        }
        .ignoresSafeArea()
    }
    
    // MARK: SubView
    private var errorContent: some View {
        ZStack {
            Image(.marvelCrash)
                .resizable()
                
            VStack {
                Text("\(error)")
                    
                Divider()
                    .frame(height: 3)
                    .overlay(.red)
                    
                Button("Close") {
                    closure?()
                }
                .frame(width: UIScreen.main.bounds.width/2-30, height: 40)
            }
            .font(.title)
            .foregroundColor(.red)
            .bold()
        }
        .frame(width: UIScreen.main.bounds.width-16, height: 220)
        .background(AppColors(colorScheme: colorScheme).blackWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(AppColors(colorScheme: colorScheme).whiteBlack, lineWidth: 5)
        )
        .cornerRadius(12)
        .clipped()
    }
}

#Preview {
    ErrorView(error: "Test Error")
}

