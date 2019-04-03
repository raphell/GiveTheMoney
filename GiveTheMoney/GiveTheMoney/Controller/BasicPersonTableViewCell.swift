//
//  BasicPersonTableViewCell.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 02/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class BasicPersonTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func insertInfo(firstName first: String, lastName last: String, phoneNumber phone: String){

        firstNameLabel.text = first
        lastNameLabel?.text = last
        phoneLabel?.text = phone
    }
}
