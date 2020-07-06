//
//  URLQueryItemEncoder.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

enum URLQueryItemEncoder {
    static func encode<Request: Encodable>(_ request: Request) throws -> [URLQueryItem] {
        let parametersData = try JSONEncoder().encode(request)
        let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
        return parameters.map { URLQueryItem(name: $0, value: $1.description) }
    }
}
