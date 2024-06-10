//
//  AppState.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - Enum AppState
enum State {
    case none, 
         herosView,
         detailView,
         loadingView,
         errorView(error: String)
}
