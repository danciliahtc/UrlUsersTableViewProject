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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        getUsers()
    }
    
    
    private func getUsers() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/users") {
            let urlSession = URLSession.shared
            
            let dataTask = urlSession.dataTask(with: url) {
                data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let decodedUsers = try
                        jsonDecoder.decode([User].self,
                        from: data)
                        
                        DispatchQueue.main.async {
                            self.users = decodedUsers
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
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
