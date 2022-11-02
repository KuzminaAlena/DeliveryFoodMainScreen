//
//  MenuAssembly.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//
import Foundation

struct MenuAssembly {

    func makeModule(
        menu: Menu?,
        menuService: MenuServiceProtocol,
        factory: MenuFactoryProtocol,
        moduleOutput: MenuModuleOutput? = nil
    ) -> Module<MenuViewController, MenuModuleInput> {
        let presenter = MenuPresenter(
            menuService: menuService,
            factory: factory,
            moduleOutput: moduleOutput
        )
        let viewController = MenuViewController(presenter: presenter)
        presenter.view = viewController
        return Module(container: viewController, moduleInput: presenter)
    }
}

protocol MenuModuleInput: AnyObject {}

protocol MenuModuleOutput: AnyObject {}
