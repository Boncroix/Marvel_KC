//
//  HerosRepository.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/5/24.
//

import Foundation

//MARK: - HeroeRepository
final class HerosRepository: HerosRepositoryProtocol {
    
    private var network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
    }
    
    func getHeros() async throws -> [Hero] {
        try await network.getHeros()
    }
}

//MARK: - HerosRepositoryFake
final class HerosRepositoryFake: HerosRepositoryProtocol {
    
    private var network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
    }
    
    func getHeros() async throws -> [Hero] {
        try await network.getHeros()
    }
}
