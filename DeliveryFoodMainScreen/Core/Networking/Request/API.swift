//
//  API.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "themealdb.com"
}

enum Path {
    case one
    var string: String {
        switch self {
        case .one:
            return "/api/json/v1/1/categories.php"
        }
    }
}

enum NetworkingError: LocalizedError {
    case dataMissing
    
    var errorDescription: String? {
        switch self {
        case .dataMissing:
            return "Данные отсутствуют"
        }
    }
}
