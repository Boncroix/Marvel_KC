//
//  AppState.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - AppState
final class RootViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var state = Status.herosView
    private var networkHeros: NetworkHerosProtocol
    private var networkSeries: NetworkSeriesProtocol
    
    // MARK: Init
    init(networkHeros: NetworkHerosProtocol = NetworkHeros(),
         networkSeries: NetworkSeriesProtocol = NetworkSeries()) {
        self.networkHeros = networkHeros
        self.networkSeries = networkSeries
    }
    
    // MARK: Functions
    func goToHeros() {
        state = .herosView
    }
    
    func goToDetail(hero: Hero) {
        state = .detailView
    }
    
    func goToLoading() {
        state = .loadingView
    }
    
    func goToError(errorString: String) {
        state = .errorView(error: errorString)
    }
}
