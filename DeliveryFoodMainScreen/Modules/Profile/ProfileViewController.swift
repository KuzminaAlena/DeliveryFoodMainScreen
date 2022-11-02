//
//  ProfileViewController.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let presenter: ProfilePresenter

    init(presenter: ProfilePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let mainView = ProfileView()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.onViewWillAppear()
    }
}

extension ProfileViewController: ProfileViewProtocol {}
