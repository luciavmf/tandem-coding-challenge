//
//  UserCell.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

final class UserCell: UITableViewCell {

    // MARK: Configuration

    func configure(with user: User) {
        textLabel?.text = user.name
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
    }
}
