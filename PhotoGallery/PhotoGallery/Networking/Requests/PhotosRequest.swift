//
//  PhotosRequest.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

struct PhotosRequest: APIRequest {
    typealias Response = [Photo]

    var resourceName: String {
        return "/photos"
    }

    var httpMethod: RequestMethod {
        return .get
    }

    let albumId: Int
}
