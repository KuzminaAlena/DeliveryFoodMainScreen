//
//  ContactsAssembly.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

struct ContactsAssembly {

    func makeModule(
        moduleOutput: ContactsModuleOutput? = nil
    ) -> Module<ContactsViewController, ContactsModuleInput> {
        let presenter = ContactsPresenter(moduleOutput: moduleOutput)
        let viewController = ContactsViewController(presenter: presenter)
        presenter.view = viewController
        return Module(container: viewController, moduleInput: presenter)
    }
}

protocol ContactsModuleInput: AnyObject {}

protocol ContactsModuleOutput: AnyObject {}
