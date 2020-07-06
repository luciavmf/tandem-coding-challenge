//
//  PhotosViewModel.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

protocol PhotosViewModelProtocol: AnyObject {
    var viewDelegate: PhotosViewDelegate? { get set }
    func viewDidLoad()
    func numberOfRows() -> Int
    func model(at index: Int) -> Photo
}

protocol PhotosViewDelegate: AnyObject {
    func didLoadData()
    func didError()
}

final class PhotosViewModel: PhotosViewModelProtocol {

    // MARK: Properties

    private var photos = [Photo]()
    weak var viewDelegate: PhotosViewDelegate?

    private let apiClient: APIClientProtocol
    private let albumId: Int

    // MARK: Init

    init(apiClient: APIClientProtocol, albumId: Int) {
        self.apiClient = apiClient
        self.albumId = albumId
    }

    // MARK: AlbumsViewModelProtocol

    func viewDidLoad() {
        let request = PhotosRequest(albumId: albumId)
        apiClient.send(request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.photos = photos
                self.viewDelegate?.didLoadData()
            case .failure:
                self.viewDelegate?.didError()
            }
        }
    }

    func numberOfRows() -> Int {
        return photos.count
    }

    func model(at index: Int) -> Photo {
        guard index >= 0,
            index < photos.count
            else {
                fatalError("Tried to load an invalid album index at: \(index)")
        }

        return photos[index]
    }
}
