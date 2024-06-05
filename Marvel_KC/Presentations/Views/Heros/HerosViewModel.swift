//
//  HerosViewModel.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - HerosViewModel
final class HerosViewModel: ObservableObject {
    
    // MARK: Properties
    private let repository: HerosRepositoryProtocol
    
    @Published var herosModel: HerosEntry = herosEntryFake
    @Published var heros: [Hero] = []
    @Published var status = AppState.none
    
    // MARK: Init
    init(repository: HerosRepositoryProtocol = HerosRepository()) {
        self.repository = repository
    }
    
    // MARK: Public Functions
    func getHeros() {
        self.status = .loadingView
        
        DispatchQueue.main.async {
            Task {
                do {
                    let (herosEntryData, herosData) = try await self.repository.getHeros()
                    self.herosModel = herosEntryData
                    self.heros = herosData
                    self.status = .herosView
                } catch {
                    let errorMessage = errorMessage(for: error)
                    self.status = .errorView(error: errorMessage)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
