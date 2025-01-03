//
//  LocalDataManager.swift
//  UrlUsersTableViewProject
//
//  Created by Dancilia Harmon   on 1/3/25.
//

import Foundation

struct LocalDataManagerTests {
    
    func readLocalJsonFile(name: String) {
        
        let bundle = Bundle.main
        
        if let url = bundle.url(forResource:name, withExtension:nil) {
            do {
                let data = try Data(contentsOf: url)
                
                let jsonDecoder = JSONDecoder()
                
                let users = try jsonDecoder.decode([User].self, from: data)
                
                
                print(users)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
