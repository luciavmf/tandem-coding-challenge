//
//  AlbumsRequest.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

struct AlbumsRequest: APIRequest {
    typealias Response = [Album]

    var resourceName: String {
        return "/albums"
    }

    var httpMethod: RequestMethod {
        return .get
    }

    let userId: Int
}
