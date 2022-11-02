//
//  MenuProtocols.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

protocol MenuPresenterProtocol: AnyObject {
    func onViewDidLoad()
}

protocol MenuViewProtocol: AnyObject {
    func update(with viewModel: MenuViewModel)
}
