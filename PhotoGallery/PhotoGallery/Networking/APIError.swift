//
//  APIError.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

enum APIError: Error {
    case service
    case decoding
    case encodingRequest
    case wrongResource
}
