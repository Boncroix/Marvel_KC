//
//  AppState.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import SwiftUI

// MARK: - Enum AppState
enum AppState {
    case none, herosView, detailView, loadingView, errorView(error: String)
}
