//
//  AppCoordinator.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: Properties

    var navigationController: UINavigationController

    private let window: UIWindow?
    private let apiClient: APIClientProtocol

    // MARK: Init

    init(window: UIWindow?, apiClient: APIClientProtocol) {
        self.navigationController = UINavigationController()
        self.window = window
        window?.rootViewController = navigationController
        self.apiClient = apiClient
    }

    // MARK: Navigation

    func start() {
        window?.makeKeyAndVisible()

        let usersCoordinator = UsersCoordinator(navigationController: navigationController, apiClient: apiClient)

        usersCoordinator.start()
    }
}
