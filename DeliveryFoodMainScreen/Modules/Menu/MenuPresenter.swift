//
//  MenuPresenter.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation

final class MenuPresenter {

    weak var view: MenuViewProtocol?
    private weak var moduleOutput: MenuModuleOutput?
    
    private let menuService: MenuServiceProtocol
    private var menu: Menu?
    private let factory: MenuFactoryProtocol
    private let banners = MenuBannersViewModel(
        banners: [
            Banners(image: .bannerExample1),
            Banners(image: .bannerExample2),
            Banners(image: .bannerExample3)
        ]
    )

    init(
        menuService: MenuServiceProtocol,
        factory: MenuFactoryProtocol,
        moduleOutput: MenuModuleOutput?
    ) {
        self.menuService = menuService
        self.factory = factory
        self.moduleOutput = moduleOutput
    }
    
    private func loadMenuFoods() {
        menuService.loadMenu(callback: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self?.menu = result
                    self?.updateView()
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
        
    private func updateView() {
        guard let menu = menu else { return }
        let viewModel = factory.createMenuViewModel(
            menu: menu,
            banners: banners)
        view?.update(with: viewModel)
    }
}

extension MenuPresenter: MenuPresenterProtocol {

    func onViewDidLoad() {
        loadMenuFoods()
        updateView()
    }
}

extension MenuPresenter: MenuModuleInput {}

