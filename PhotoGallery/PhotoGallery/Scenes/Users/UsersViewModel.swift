//
//  UsersViewModel.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

protocol UsersViewModelProtocol: AnyObject {
    var viewDelegate: UsersViewDelegate? { get set }
    func viewDidLoad()
    func numberOfRows() -> Int
    func model(at index: Int) -> User
    func didSelectModel(at index: Int)
}

protocol UsersViewDelegate: AnyObject {
    func didLoadData()
    func didError()
}

final class UsersViewModel: UsersViewModelProtocol {

    // MARK: Properties

    private var users = [User]()
    weak var viewDelegate: UsersViewDelegate?

    private let apiClient: APIClientProtocol
    private let coordinator: UsersCoordinatorProtocol

    // MARK: Init

    init(apiClient: APIClientProtocol, coordinator: UsersCoordinatorProtocol) {
        self.apiClient = apiClient
        self.coordinator = coordinator
    }

    // MARK: UsersViewModelProtocol

    func viewDidLoad() {
        let request = UsersRequest()
        apiClient.send(request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
                self.viewDelegate?.didLoadData()
            case .failure:
                self.viewDelegate?.didError()
            }
        }
    }

    func numberOfRows() -> Int {
        return users.count
    }

    func model(at index: Int) -> User {
        guard index >= 0,
            index < users.count
            else {
                fatalError("Tryed to load an invalid user index at: \(index)")
        }

        return users[index]
    }

    func didSelectModel(at index: Int) {
        let user = model(at: index)
        coordinator.navigateToAlbums(with: user)
    }
}
