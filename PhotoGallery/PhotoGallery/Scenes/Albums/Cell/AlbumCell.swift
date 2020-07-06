//
//  AlbumCell.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

final class AlbumCell: UITableViewCell {

    // MARK: Configuration

    func configure(with album: Album) {
        textLabel?.text = album.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
    }
}
