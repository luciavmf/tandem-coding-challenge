//
//  Album.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String
}
