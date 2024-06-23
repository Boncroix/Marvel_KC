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
        private let height = WKInterfaceDevice.current().screenBounds.height / 2
        private let width = WKInterfaceDevice.current().screenBounds.width - 16
    #else
        private let height = UIScreen.main.bounds.height / 3
        private let width = UIScreen.main.bounds.width - 16
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
                        .id(0)
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
            .id(1)
            
            VStack {
                
                Spacer()
                
                Text(hero.name)
                    .font(AppFonts().textM)
                    .bold()
                    .padding()
                    .id(2)
                .foregroundStyle(AppColors(colorScheme: colorScheme).blackWhite)
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

// MARK: - Preview
#Preview {
    HerosRowView(hero: character2)
}
