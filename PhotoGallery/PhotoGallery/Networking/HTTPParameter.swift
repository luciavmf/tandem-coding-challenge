//
//  HTTPParameter.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

enum HTTPParameter: CustomStringConvertible, Decodable {
    case int(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else {
            throw APIError.decoding
        }
    }

    var description: String {
        switch self {
        case .int(let int):
            return String(describing: int)
        }
    }
}
