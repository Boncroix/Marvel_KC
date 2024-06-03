//
//  AppState.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import Foundation

// MARK: - Enum AppState
enum AppState {
    case home, loading, loaded, error(error: String)
}
