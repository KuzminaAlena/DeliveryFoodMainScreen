//
//  ContactsPresenter.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

final class ContactsPresenter {

    weak var view: ContactsViewProtocol?
    private weak var moduleOutput: ContactsModuleOutput?

    init(
        moduleOutput: ContactsModuleOutput?
    ) {
        self.moduleOutput = moduleOutput
    }
}

extension ContactsPresenter: ContactsPresenterProtocol {

    func onViewDidLoad() {
    }

    func onViewWillAppear() {
    }
}

extension ContactsPresenter: ContactsModuleInput {}

