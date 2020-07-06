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
        seutUpView()
    }

    // MARK: Set Up

    private func seutUpView() {
        view.backgroundColor = .white
    }
}
