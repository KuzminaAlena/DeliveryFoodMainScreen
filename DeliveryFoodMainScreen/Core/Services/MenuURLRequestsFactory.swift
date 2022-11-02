//
//  MenuURLRequestsFactory.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation


protocol MenuURLRequestFactoryProtocol {
    func createMenuURLRequest() -> URLRequest?
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

final class MenuURLRequestFactory: MenuURLRequestFactoryProtocol {
    func createMenuURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = Path.one.string
        guard let url = components.url else { return nil }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
