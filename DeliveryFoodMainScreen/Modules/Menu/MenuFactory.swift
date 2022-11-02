//
//  MenuFactory.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation
import UIKit

protocol MenuFactoryProtocol {
    func createMenuViewModel(
        menu: Menu,
        banners: MenuBannersViewModel
    ) -> MenuViewModel
}

final class MenuFactory: NSObject, MenuFactoryProtocol {
    
    func createMenuViewModel(menu: Menu, banners: MenuBannersViewModel) -> MenuViewModel {
        
        let bannersSection = createBannersViewModel(from: banners)
        let tagsSection = createTagsSections(from: menu)
        
        let menuViewModel = MenuViewModel(
            sections: [
                bannersSection,
                tagsSection
            ]
        )
        return menuViewModel
    }
    
    private func createBannersViewModel(from banners: MenuBannersViewModel) -> MenuSection {
        return MenuSection(
            header: MenuHeaderType.none,
            cells: [
                MenuCellType.banners(banners)
            ]
        )
    }

    private func createTagsSections(from menu: Menu) -> MenuSection {
        var sectionCells: [MenuCellType] = [MenuCellType.topFrame]
        menu.categories.forEach {
            let viewModel = MenuFoodCellViewModel(
                imageURL: $0.strCategoryThumb,
                title: $0.strCategory,
                subtitle: $0.strCategoryDescription,
                price: "345"
            )
            let cellData = MenuCellType.mainCell(viewModel)
            sectionCells.append(cellData)
        }
        
        let tags = createTagsViewModels(from: menu)
        
        return MenuSection(
            header: MenuHeaderType.tags(tags),
            cells: sectionCells
        )
    }
    
    private func createTagsViewModels(from menu: Menu) -> MenuTagsViewModel {
        var menuTagsViewModel = MenuTagsViewModel(tags: [])
        menu.categories.forEach {
            let viewModel = MenuTagViewModel(
                title: $0.strCategory
            )
            menuTagsViewModel.tags.append(viewModel)
        }
        return menuTagsViewModel
    }
}
