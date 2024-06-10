//
//  Marvel_KCApp.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 29/4/24.
//

import SwiftUI

// MARK: - Marvel_KCApp
@main
struct Marvel_KCApp: App {
    
    // MARK: View
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: HerosViewModel())
        }
    }
}
