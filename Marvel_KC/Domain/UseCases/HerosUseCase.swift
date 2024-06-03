//
//  HerosUseCase.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/5/24.
//

import Foundation

//MARK: - Protocol
protocol HerosUseCaseProtocol {
    var repository: HerosRepositoryProtocol {get set}
    func getHeros() async throws -> [Hero]
}

//MARK: - HerosUseCase
final class HerosUseCase: HerosUseCaseProtocol {
    var repository: any HerosRepositoryProtocol
    
    //MARK: - Inits
    init(repository: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())) {
        self.repository = repository
    }
    
    //MARK: - GetHeros
    func getHeros() async throws -> [Hero] {
        return try await repository.getHeros()
    }
}

//MARK: - HerosUseCaseFake
final class HerosUseCaseFake: HerosUseCaseProtocol {
    var repository: any HerosRepositoryProtocol
    
    //MARK: - Inits
    init(repository: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())) {
        self.repository = repository
    }
    
    //MARK: - GetHeros
    func getHeros() async throws -> [Hero] {
        return try await repository.getHeros()
    }
}

