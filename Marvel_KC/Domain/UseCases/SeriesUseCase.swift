//
//  SeriesUseCase.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - Protocol
protocol SeriesUseCaseProtocol {
    var repository: SeriesRepositoryProtocol {get set}
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}

// MARK: - SeriesUseCase
final class SeriesUseCase: SeriesUseCaseProtocol {
    
    // MARK: Properties
    var repository: any SeriesRepositoryProtocol
    
    // MARK: Inits
    init(repository: SeriesRepositoryProtocol = SeriesRepository(network: NetworkSeries())) {
        self.repository = repository
    }
    
    // MARK: GetSeries
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        return try await repository.getSeries(hero: hero)
    }
}

// MARK: - SeriesUseCaseFake
final class SeriesUseCaseFake: SeriesUseCaseProtocol {
    
    // MARK: Properties
    var repository: any SeriesRepositoryProtocol
    
    // MARK: Inits
    init(repository: SeriesRepositoryProtocol = SeriesRepositoryFake(network: NetworkSeriesFake())) {
        self.repository = repository
    }
    
    // MARK: GetSeries
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        return try await repository.getSeries(hero: hero)
    }
}
