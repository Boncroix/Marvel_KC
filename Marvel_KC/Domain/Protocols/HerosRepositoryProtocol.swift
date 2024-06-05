//
//  HerosRepositoryProtocol.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 10/5/24.
//

import Foundation
import MarvelAppLibrary

//MARK: - HerosRepositoryProtocol
protocol HerosRepositoryProtocol {
    func getHeros() async throws -> (HerosEntry, [Hero])
}
