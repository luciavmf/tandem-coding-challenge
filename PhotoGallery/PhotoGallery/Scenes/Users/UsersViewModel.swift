//
//  UsersViewModel.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

protocol UsersViewModelProtocol: AnyObject {

    func viewDidLoad()
    func numberOfRows() -> Int
    func model(at index: Int) -> User
}

final class UsersViewModel: UsersViewModelProtocol {

    private var users = [User]()

    func viewDidLoad() {

    }

    func numberOfRows() -> Int {
        return users.count
    }

    func model(at index: Int) -> User {
        guard index > 0,
            index < users.count
            else {
                fatalError("Tryed to load an invalid user index at: \(index)")
        }

        return users[index]
    }
}
