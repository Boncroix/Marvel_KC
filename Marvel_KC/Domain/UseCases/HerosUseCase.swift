//
//  HerosUseCase.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/5/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - Protocol
protocol HerosUseCaseProtocol {
    var repository: HerosRepositoryProtocol {get set}
    func getHeros() async throws -> (HerosEntry, [Hero])
}

// MARK: - HerosUseCase
final class HerosUseCase: HerosUseCaseProtocol {
    
    // MARK: Properties
    var repository: any HerosRepositoryProtocol
    
    // MARK: - Inits
    init(repository: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())) {
        self.repository = repository
    }
    
    // MARK: - GetHeros
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        return try await repository.getHeros()
    }
}

// MARK: - HerosUseCaseFake
final class HerosUseCaseFake: HerosUseCaseProtocol {
    
    // MARK: Properties
    var repository: HerosRepositoryProtocol
    
    // MARK: - Inits
    init(repository: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())) {
        self.repository = repository
    }
    
    // MARK: - GetHeros
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        return try await repository.getHeros()
    }
}

