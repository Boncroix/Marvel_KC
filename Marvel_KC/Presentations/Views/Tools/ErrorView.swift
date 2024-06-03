//
//  ErrorView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    var error: String
    var closure: (() -> Void)?
    
    // MARK: View
    var body: some View {
        ZStack {
            Image("fondo1")
                .resizable()
            
            Color.white.opacity(0.4)
            
            errorContent
        }
        .ignoresSafeArea()
    }
    
    private var errorContent: some View {
        ZStack {
            Image(.LKC)
                .resizable()
                .opacity(0.2)
            
            VStack {
                Text("\(error)")
                    .font(.title2)
                    .foregroundColor(.red)
                    .bold()
                
                Divider()
                    .frame(height: 2)
                    .overlay(.red)
                
                Button("Close") {
                    closure?()
                }
                .font(.title2)
                .foregroundColor(.red)
                .frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                .bold()
            }
        }
        .frame(width: UIScreen.main.bounds.width-50, height: 180)
        .background(Color.gray)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.white, lineWidth: 5)
        )
        .cornerRadius(12)
        .clipped()
    }
}

#Preview {
    ErrorView(error: "Test Error")
}

