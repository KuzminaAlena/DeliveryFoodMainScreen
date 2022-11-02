//
//  BasketAssembly.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

struct BasketAssembly {

    func makeModule(
        moduleOutput: BasketModuleOutput? = nil
    ) -> Module<BasketViewController, BasketModuleInput> {
        let presenter = BasketPresenter(moduleOutput: moduleOutput)
        let viewController = BasketViewController(presenter: presenter)
        presenter.view = viewController
        return Module(container: viewController, moduleInput: presenter)
    }
}

protocol BasketModuleInput: AnyObject {}

protocol BasketModuleOutput: AnyObject {}
