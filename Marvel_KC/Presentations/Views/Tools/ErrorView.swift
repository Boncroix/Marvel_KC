//
//  ErrorView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI
import MarvelAppLibrary

struct ErrorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: Properties
    var error: String
    var closure: (() -> Void)?
    
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
                .opacity(0.6)
                
            VStack {
                Text("\(error)")
                    .font(.title)
                    .foregroundColor(.red)
                    .bold()
                    
                Divider()
                    .frame(height: 3)
                    .overlay(.red)
                    
                Button("Close") {
                    closure?()
                }
                .font(.title)
                .foregroundColor(.red)
                .frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                .bold()
            }
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

