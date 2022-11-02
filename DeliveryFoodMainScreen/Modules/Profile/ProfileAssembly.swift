//
//  ProfileAssembly.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

struct ProfileAssembly {

    func makeModule(
        moduleOutput: ProfileModuleOutput? = nil
    ) -> Module<ProfileViewController, ProfileModuleInput> {
        let presenter = ProfilePresenter(moduleOutput: moduleOutput)
        let viewController = ProfileViewController(presenter: presenter)
        presenter.view = viewController
        return Module(container: viewController, moduleInput: presenter)
    }
}

protocol ProfileModuleInput: AnyObject {}

protocol ProfileModuleOutput: AnyObject {}
