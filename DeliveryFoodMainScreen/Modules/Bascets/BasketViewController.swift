//
//  BasketViewController.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import UIKit

final class BasketViewController: UIViewController {

    private let presenter: BasketPresenter

    init(presenter: BasketPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let mainView = BasketView()

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

extension BasketViewController: BasketViewProtocol {}
