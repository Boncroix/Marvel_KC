//
//  HerosRowView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 5/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - HerosRowView
struct HerosRowView: View {
    
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    private var hero: Hero
    
    #if os(watchOS)
        private let height = UIScreen.main.bounds.height/2
    #else
        private let height = UIScreen.main.bounds.height/3
    #endif
    
    // MARK: Init
    init(hero: Hero) {
        self.hero = hero
    }
    
    // MARK: View
    var body: some View {
        
        ZStack {
            if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    PlaceHolderImage()
                }
            } else {
                PlaceHolderImage()
            }
            
            LinearGradient(
                colors: [AppColors(colorScheme: colorScheme).whiteBlack, .clear],
                startPoint: .bottom,
                endPoint: .center
                )
            
            VStack {
                
                Spacer()
                
                Text(hero.name)
                    .font(AppFonts().textM)
                    .bold()
                    .padding()
                .foregroundStyle(AppColors(colorScheme: colorScheme).blackWhite)
            }
        }
        .frame(width: UIScreen.main.bounds.width-16, height: height)
        .cornerRadius(50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(AppColors(colorScheme: colorScheme).whiteBlack, lineWidth: 2)
        )
    }
}

// MARK: - Preview
#Preview {
    HerosRowView(hero: character2)
}
