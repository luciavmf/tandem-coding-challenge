//
//  AlbumsViewModel.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

protocol AlbumsViewModelProtocol: AnyObject {
    var viewDelegate: AlbumsViewDelegate? { get set }
    func viewDidLoad()
    func numberOfRows() -> Int
    func model(at index: Int) -> Album
    func didSelectModel(at index: Int)
}

protocol AlbumsViewDelegate: AnyObject {
    func didLoadData()
    func didError()
}

final class AlbumsViewModel: AlbumsViewModelProtocol {

    // MARK: Properties

    private var albums = [Album]()
    weak var viewDelegate: AlbumsViewDelegate?

    private let apiClient: APIClientProtocol
    private let userId: Int

    private let coordinator: AlbumsCoordinatorProtocol

    // MARK: Init

    init(apiClient: APIClientProtocol, coordinator: AlbumsCoordinatorProtocol, userId: Int) {
        self.apiClient = apiClient
        self.userId = userId
        self.coordinator = coordinator
    }

    // MARK: AlbumsViewModelProtocol

    func viewDidLoad() {
        let request = AlbumsRequest(userId: userId)
        apiClient.send(request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let albums):
                self.albums = albums
                self.viewDelegate?.didLoadData()
            case .failure:
                self.viewDelegate?.didError()
            }
        }
    }

    func numberOfRows() -> Int {
        return albums.count
    }

    func model(at index: Int) -> Album {
        guard index >= 0,
            index < albums.count
            else {
                fatalError("Tried to load an invalid album index at: \(index)")
        }

        return albums[index]
    }

    func didSelectModel(at index: Int) {
        let album = model(at: index)
        coordinator.navigateToPhotos(album: album)
    }
}
