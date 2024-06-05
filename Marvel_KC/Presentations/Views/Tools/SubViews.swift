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
    
    @Environment(\.colorScheme) var colorScheme
    let opatity: Double
    
    init(opatity: Double = 0) {
        self.opatity = opatity
    }
    
    var body: some View {
        ZStack {
            Image(.backgroud)
                .resizable()
            Color(AppColors(colorScheme: colorScheme).whiteBlack.opacity(opatity))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundSubView()
}
