//
//  URLResponse+Extension.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

extension URLResponse {
    func getStatusCode() -> Int {
        if let httpResponse = self as? HTTPURLResponse{
            return httpResponse.statusCode
        } else {
            return 0
        }
    }
}
