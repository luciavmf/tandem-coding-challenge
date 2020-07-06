//
//  PhotoCell.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

final class PhotoCell: UITableViewCell {

    func configure(with photo: Photo) {
        textLabel?.text = photo.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
      }
}
