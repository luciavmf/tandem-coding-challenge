//
//  AlbumsCoordinator.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

protocol AlbumsCoordinatorProtocol {
    func navigateToPhotos(album: Album)
}

final class AlbumsCoordinator: Coordinator {

    private let navigationController: UINavigationController
    private let user: User
    private let apiClient: APIClientProtocol

    init(navigationController: UINavigationController,
         apiClient: APIClientProtocol,
         user: User) {
        self.navigationController = navigationController
        self.user = user
        self.apiClient = apiClient
    }

    func start() {
        let viewModel = AlbumsViewModel(
            apiClient: apiClient,
            coordinator: self,
            userId: user.id ?? 0
        )
        let viewController = AlbumsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AlbumsCoordinator: AlbumsCoordinatorProtocol {
    func navigateToPhotos(album: Album) {
        let viewModel = PhotosViewModel(apiClient: apiClient, albumId: album.id)
        let viewController = PhotosViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
