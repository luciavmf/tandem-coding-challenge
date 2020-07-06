//
//  UsersRequest.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

struct UsersRequest: APIRequest {
    typealias Response = [User]

    var resourceName: String {
        return "/users"
    }

    var httpMethod: RequestMethod {
        return .get
    }
}
