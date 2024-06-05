//
//  HerosView.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 29/4/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - HerosView
struct HerosView: View {
    
    // MARK: Properties
    @ObservedObject var herosViewModel: HerosViewModel
    
    // MARK: Init
    init(herosViewModel: HerosViewModel = HerosViewModel()) {
        self.herosViewModel = herosViewModel
    }
    
    // MARK: View
    var body: some View {
        ZStack {
            BackgroundSubView(opatity: 0.1)
        }
    }
}

#Preview {
    HerosView()
}
