//
//  CustomCell.swift
//  MVPExample
//
//  Created by Sanad Barjawi on 7/29/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func populateCell(name:String,age:String){
        self.nameLbl.text = name
        self.ageLbl.text = age
    }
}
