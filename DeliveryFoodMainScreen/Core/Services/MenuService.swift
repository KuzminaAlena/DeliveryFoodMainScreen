//
//  MenuService.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//


import Foundation
import UIKit

protocol MenuServiceProtocol {
    func loadMenu(callback: @escaping (Result<Menu, Error>) -> Void)
}

final class MenuService: MenuServiceProtocol {
    
    private let requestLoader: RequestLoaderProtocol
    let factory: MenuURLRequestFactoryProtocol
    
    init(requestLoader: RequestLoaderProtocol,
         factory: MenuURLRequestFactoryProtocol) {
        self.requestLoader = requestLoader
        self.factory = factory
    }
    
    func loadMenu(callback: @escaping (Result<Menu, Error>) -> Void) {
        guard let urlRequest = factory.createMenuURLRequest()  else { return }
        requestLoader.loadModel(Menu.self, urlRequest, callback: callback)
    }

    func downloadImage(from urlString: String) -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        var image: UIImage?
        factory.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            image = UIImage(data: data)
        }
        return image
    }
}
