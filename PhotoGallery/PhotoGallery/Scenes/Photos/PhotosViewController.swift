//
//  PhotosViewController.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController {

    // MARK: Properties

    private let viewModel: PhotosViewModelProtocol

    // MARK: Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Init

    init(viewModel: PhotosViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        viewModel.viewDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        setUpView()
        setUpConstraints()
    }

    // MARK: Set Up

    private func setUpView() {
        view.backgroundColor = .white

        tableView.register(PhotoCell.self, forCellReuseIdentifier: PhotoCell.reuseIdentifier)
        tableView.dataSource = self
    }

    private func setUpConstraints() {
        view.addSubview(tableView)

        let layourGuide = view.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: layourGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layourGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layourGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layourGuide.bottomAnchor).isActive = true
    }
}

extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.reuseIdentifier) as? PhotoCell else {
            fatalError("Could not find registered cell \(String(describing: PhotoCell.self))")
        }

        let model = viewModel.model(at: indexPath.row)
        cell.configure(with: model)
        return cell
    }
}

extension PhotosViewController: PhotosViewDelegate {
    func didLoadData() {
        tableView.reloadData()
    }

    func didError() {
        // TODO: Implement error view
    }
}
