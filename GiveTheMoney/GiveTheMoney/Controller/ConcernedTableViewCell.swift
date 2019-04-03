//
//  ConcernedTableViewCell.swift
//  GiveTheMoney
//
//  Created by Raphael LUCIANO on 03/04/2019.
//  Copyright © 2019 Raphael LUCIANO. All rights reserved.
//

import UIKit

class ConcernedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var firstNameLab: UILabel!
    @IBOutlet weak var lastNameLab: UILabel!
    @IBOutlet weak var amountLab: UILabel!
    
    public func insertInfo(firstName first: String, lastName last: String, amountSpent amount: String){
        
        firstNameLab.text = first
        lastNameLab?.text = last
        amountLab?.text = amount
    }
}
