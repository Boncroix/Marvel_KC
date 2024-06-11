//
//  Status.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - Enum AppState
enum Status {
    case none,
         home,
         loadingView,
         errorView(error: String)
}
