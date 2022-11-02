//
//  ProfilePresenter.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

final class ProfilePresenter {

    weak var view: ProfileViewProtocol?
    private weak var moduleOutput: ProfileModuleOutput?

    init(
        moduleOutput: ProfileModuleOutput?
    ) {
        self.moduleOutput = moduleOutput
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {

    func onViewDidLoad() {
    }

    func onViewWillAppear() {
    }
}

extension ProfilePresenter: ProfileModuleInput {}

