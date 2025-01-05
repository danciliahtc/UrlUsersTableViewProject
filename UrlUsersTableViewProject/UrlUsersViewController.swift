//
//  ViewController.swift
//  UrlUsersTableViewProject
//
//  Created by Dancilia Harmon   on 1/3/25.
//

import UIKit

class UrlUsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users: [User] = []
    private let localDataManager = LocalDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        localDataManager.readData { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Failed to load users: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension UrlUsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UrlUsersTableViewCell
        
        let user = users[indexPath.row]
        
        cell?.configure(user: user)
        
        return cell ?? UITableViewCell()
    }
}
