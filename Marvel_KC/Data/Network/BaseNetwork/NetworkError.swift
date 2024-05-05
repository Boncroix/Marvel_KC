//
//  NetworkError.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

//MARK: - NetworkError
enum NetworkError: Error {
    case malformedURL
    case dataEncodingFailed
    case tokenFormatError
    case statusCodeError(Int)
    case noData
    case dataDecodingFailed
}
//Return String NetworkError
func errorMessage(for error: Error) -> String {
    guard let networkError = error as? NetworkError else {
        return "UNKNOWN ERROR"
    }
    
    switch networkError {
    case .malformedURL:
        return "MALFORMED URL"
    case .dataEncodingFailed:
        return "DATA ENCODING FAILED"
    case .tokenFormatError:
        return "TOKEN FORMAT ERROR"
    case .statusCodeError(let errorCode):
        return "ERROR CODE \(errorCode)"
    case .noData:
        return "NO DATA"
    case .dataDecodingFailed:
        return "DATA DECODING FAILED"
    }
}

