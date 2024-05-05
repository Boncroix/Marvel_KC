//
//  AppState.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 3/5/24.
//

import Foundation

//MARK: - Enum State
enum AppStatus {
    case home, detail
}

final class AppState: ObservableObject {
    @Published var status = AppStatus.home
    
    init() {
    }
    
    func getHeros() {
        Task {
            
        }
    }
}
