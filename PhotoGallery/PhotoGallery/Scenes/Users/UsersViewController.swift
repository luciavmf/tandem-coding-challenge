//
//  UsersViewController.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import UIKit

final class UsersViewController: UIViewController {

    // MARK: Properties

    private let viewModel: UsersViewModelProtocol

    // MARK: Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Init

    init(viewModel: UsersViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
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

        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseIdentifier)
        tableView.delegate = self
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

extension UsersViewController: UITableViewDelegate {
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier) as? UserCell else {
            fatalError("Could not find registered cell \(String(describing: UserCell.self))")
        }

        let model = viewModel.model(at: indexPath.row)
        cell.configure(with: model)
        return cell
    }
}
