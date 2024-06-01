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

//MARK: - AppState
final class AppState: ObservableObject {
    @Published var status = AppStatus.home
    private var network: NetworkHerosProtocol
    
    //MARK: - Inits
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
    }
    
    //MARK: - GetHeros
    func getHeros() {
        Task {
            // TODO - Pedir Heroes
        }
    }
}
