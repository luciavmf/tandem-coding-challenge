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
    private var mainCoordinator: AppCoordinator!

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let baseURL = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("Could not create te baseURL for the api client")
        }

        apiClient = APIClient(baseURL: baseURL)

        // Use a UIHostingController as window root view controller.
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Could not create the scene")
        }

        window = UIWindow(windowScene: windowScene)
        mainCoordinator = AppCoordinator(window: window, apiClient: apiClient!)
        mainCoordinator.start()
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
