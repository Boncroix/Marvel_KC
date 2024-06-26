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
            Color(Color(.black).opacity(opatity))
                .id(1)
        }
        .ignoresSafeArea()
    }
}

// MARK: PlaceHolderImage
struct PlaceHolderImage: View {
    
    // MARK: View
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .foregroundColor(Color(.black))
            .id(0)
    }
}

// MARK: - Preview
#Preview {
    BackgroundSubView()
}

