//
//  SeriesRepositoryProtocol.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 9/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - SeriesRepositoryProtocol
protocol SeriesRepositoryProtocol {
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}
