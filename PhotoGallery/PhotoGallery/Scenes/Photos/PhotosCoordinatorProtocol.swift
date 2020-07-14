//
//  PhotosCoordinatorProtocol.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 14/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

protocol PhotosCoordinatorProtocol: Coordinator {
    func finalize()
}

final class PhotosCoordinator: PhotosCoordinatorProtocol {

    private let navigationController: UINavigationController
    private var childNavigationController: UINavigationController?
    private let apiClient: APIClientProtocol
    private let albumId: Int

    init(apiClient: APIClientProtocol, albumId: Int, navigationController: UINavigationController) {
        self.apiClient = apiClient
        self.albumId = albumId
        self.navigationController = navigationController
    }

    func finalize() {
        childNavigationController?.dismiss(animated: true, completion: {})
    }

    func start() {
        let viewModel = PhotosViewModel(apiClient: apiClient, albumId: albumId, coordinator: self)
        let viewController = PhotosViewController(viewModel: viewModel)
        let childNavigationController = UINavigationController(rootViewController: viewController)

        navigationController.present(childNavigationController, animated: true)

        self.childNavigationController = childNavigationController
    }

}
