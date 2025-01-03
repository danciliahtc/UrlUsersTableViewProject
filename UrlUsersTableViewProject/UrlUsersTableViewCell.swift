//
//  UrlUsersTableViewCell.swift
//  UrlUsersTableViewProject
//
//  Created by Dancilia Harmon   on 1/3/25.
//

import UIKit

class UrlUsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var phoneLbl: UILabel!
    
    @IBOutlet weak var companyLbl: UILabel!
    
    @IBOutlet weak var usernameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    func configure(user: User) {
        
        nameLbl.text = user.name
        usernameLbl.text = user.username
        emailLbl.text = user.email
        phoneLbl.text = user.phone
        companyLbl.text = user.company.name
    }
}
