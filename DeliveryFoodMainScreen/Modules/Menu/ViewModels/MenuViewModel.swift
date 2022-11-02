//
//  MenuViewModel.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation
import UIKit

struct MenuViewModel {
    let sections: [MenuSection]
}

struct MenuSection {
    let header: MenuHeaderType
    let cells: [MenuCellType]
}

enum MenuHeaderType {
    case none
    case tags(MenuTagsViewModel)
}

enum MenuCellType {
    case banners(MenuBannersViewModel)
    case topFrame
    case mainCell(MenuFoodCellViewModel)
}
