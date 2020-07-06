//
//  APIRequest.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

// All the requests must conform to this protocol.
protocol APIRequest: Encodable {
    associatedtype Response: Decodable

    var resourceName: String { get }
    var httpMethod: RequestMethod { get }
}

/// Available methods that the API client supports
enum RequestMethod: String {
    case get = "GET"
}
