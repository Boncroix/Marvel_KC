//
//  HerosViewModel.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 2/6/24.
//

import Foundation

final class HerosViewModel: ObservableObject {
    
    // MARK: Properties
    private let repository: HerosRepositoryProtocol
    @Published var heros: [Hero] = []
    @Published var status = AppState.home
    
    // MARK: Init
    init(repository: HerosRepositoryProtocol = HerosRepository()) {
        self.repository = repository
    }
    
    // MARK: Public Functions
    func getHeros() {
        self.status = .loading
        
        DispatchQueue.main.async {
            Task {
                do {
                    let herosData = try await self.repository.getHeros()
                    self.heros = herosData
                    self.status = .loaded
                } catch {
                    let errorMessage = errorMessage(for: error)
                    self.status = .error(error: errorMessage)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
