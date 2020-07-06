//
//  SceneDelegate.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var apiClient: APIClient?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let baseURL = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("Could not create te baseURL for the api client")
        }

        apiClient = APIClient(baseURL: baseURL)

        let viewModel = UsersViewModel(apiClient: apiClient!)
        let viewController = UsersViewController(viewModel: viewModel)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: viewController)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
