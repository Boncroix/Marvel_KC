//
//  SubViews.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 5/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - BackgroundSubView
struct BackgroundSubView: View {
    
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    let opatity: Double
    
    // MARK: Init
    init(opatity: Double = 0) {
        self.opatity = opatity
    }
    
    // MARK: View
    var body: some View {
        
        ZStack {
            Image("backgroud")
                .resizable()
                .id(0)
            Color(AppColors(colorScheme: colorScheme).whiteBlack.opacity(opatity))
                .id(1)
        }
        .ignoresSafeArea()
    }
}

// MARK: PlaceHolderImage
struct PlaceHolderImage: View {
    
    // MARK: Propreties
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: View
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .foregroundColor(AppColors(colorScheme: colorScheme).whiteBlack)
            .id(0)
    }
}

// MARK: - Preview
#Preview {
    BackgroundSubView()
}

