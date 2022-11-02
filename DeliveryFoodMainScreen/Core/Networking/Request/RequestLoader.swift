//
//  RequestLoader.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 14.10.2022.
//

import Foundation

protocol RequestLoaderProtocol {
    @discardableResult
    func loadData(_ request: URLRequest,
                  callback: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask
}

extension RequestLoaderProtocol {
    
    @discardableResult
    func loadModel<Model: Codable>(_ modelType: Model.Type,
                                   _ request: URLRequest,
                                   callback: @escaping (Result<Model, Error>) -> Void) -> URLSessionDataTask {
        loadData(request) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    callback(.failure(NetworkingError.dataMissing))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(Model.self, from: data)
                    callback(.success(model))
                } catch let error {
                    callback(.failure(error))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

class RequestLoader: RequestLoaderProtocol {
    
    private let session = URLSession.shared
    
    @discardableResult
    func loadData(_ request: URLRequest,
                  callback: @escaping (Result<Data?, Error>) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                callback(.failure(error))
            } else {
                callback(.success(data))
            }
        })
        task.resume()
        return task
    }
}
