//
//  SeriesRepository.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 9/6/24.
//


import Foundation
import MarvelAppLibrary

// MARK: - SeriesRepository
final class SeriesRepository: SeriesRepositoryProtocol {
    
    // MARK: Properties
    private var network: NetworkSeriesProtocol
    
    // MARK: Init
    init(network: NetworkSeriesProtocol = NetworkSeries()) {
        self.network = network
    }
    
    // MARK: Functions
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        try await network.getSeries(hero: hero)
    }
}

// MARK: - SeriesRepositoryFake
final class SeriesRepositoryFake: SeriesRepositoryProtocol {
    
    // MARK: Properties
    private var network: NetworkSeriesProtocol
    
    // MARK: Init
    init(network: NetworkSeriesProtocol = NetworkSeriesFake()) {
        self.network = network
    }
    
    // MARK: Functions
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        try await network.getSeries(hero: hero)
    }
}
