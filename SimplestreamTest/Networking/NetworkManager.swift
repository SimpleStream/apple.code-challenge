//
//  NetworkManager.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 21/09/2021.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCategories(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
        
    func fetchCategories(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }

}
