//
//  UserTableViewCell.swift
//  pods3
//
//  Created by Enrique Zamudio on 03/08/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImageView: UIView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    //Creamos un nuevo método
    
    func configCelda (username: String, message: String){
        
        userNameLabel.text = username
        messageLabel.text = message
    }
}
