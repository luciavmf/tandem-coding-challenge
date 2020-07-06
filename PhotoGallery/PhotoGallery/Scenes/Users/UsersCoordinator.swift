//
//  UsersCoordinator.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

protocol UsersCoordinatorProtocol: AnyObject {
    func navigateToAlbums(with user: User)
}

class UsersCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let apiClient: APIClientProtocol

    init(navigationController: UINavigationController,
         apiClient: APIClientProtocol) {
        self.navigationController = navigationController
        self.apiClient = apiClient
    }

    func start() {
        let viewModel = UsersViewModel(apiClient: apiClient, coordinator: self)
        let viewController = UsersViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension UsersCoordinator: UsersCoordinatorProtocol {

    func navigateToAlbums(with user: User) {
        let albumsCoordinator = AlbumsCoordinator(
            navigationController: navigationController,
            apiClient: apiClient,
            user: user)

        albumsCoordinator.start()
    }
}
