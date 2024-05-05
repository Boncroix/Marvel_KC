//
//  EndPoints.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

// MARK: - EndPoints
enum EndPoints: String {
    case heros
    case series
}

//Return StringEndpoint
func stringEndpoint(id: Int = 0, endpoint: EndPoints) -> String {
    switch endpoint {
    case .heros:
        return "/v1/public/characters?"
    case .series:
        return "/v1/public/characters/\(String(describing: id))/series"
    }
}
