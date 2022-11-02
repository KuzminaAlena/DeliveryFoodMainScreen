//
//  BasketPresenter.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

final class BasketPresenter {

    weak var view: BasketViewProtocol?
    private weak var moduleOutput: BasketModuleOutput?

    init(
        moduleOutput: BasketModuleOutput?
    ) {
        self.moduleOutput = moduleOutput
    }
}

extension BasketPresenter: BasketPresenterProtocol {

    func onViewDidLoad() {
    }

    func onViewWillAppear() {

    }
}

extension BasketPresenter: BasketModuleInput {}

