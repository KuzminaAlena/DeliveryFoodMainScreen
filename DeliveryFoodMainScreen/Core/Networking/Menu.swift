//
//  Menu.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation

// MARK: - Menu
struct Menu: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
