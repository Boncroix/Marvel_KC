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
    private let useCaseHeros: HerosUseCaseProtocol
    
    @Published var herosModel: HerosEntry = herosEntryFake
    @Published var heros: [Hero] = []
    @Published var status = Status.none
    
    // MARK: Init
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
    }
    
    // MARK: Public Functions
    @MainActor
    func getHeros() {
        self.status = .loadingView
        
        DispatchQueue.main.async {
            Task {
                do {
                    let (herosEntryData, herosData) = try await self.useCaseHeros.getHeros()
                    self.herosModel = herosEntryData
                    self.heros = herosData
                    self.status = .home
                } catch {
                    let errorMessage = errorMessage(for: error)
                    self.status = .errorView(error: errorMessage)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
