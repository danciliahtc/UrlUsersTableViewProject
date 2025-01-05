//
//  LocalDataManager.swift
//  UrlUsersTableViewProject
//
//  Created by Dancilia Harmon   on 1/3/25.
//

import Foundation

enum NetworkError: Error {
    case incorrectUrl
    case responseError
    case decodingFailed
}

struct LocalDataManager {
    
    func readData(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(.incorrectUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.responseError))
                return
            }
            
            do {
                let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                completion(.success(decodedUsers))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}
