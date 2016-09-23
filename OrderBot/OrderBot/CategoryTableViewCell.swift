//
//  CategoryTableViewCell.swift
//  OrderBot
//
//  Created by Christopher Tao on 18/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var radioImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected == true {
            self.radioImageView.image = UIImage(named: "radioSelected")
        }else{
            self.radioImageView.image = UIImage(named: "radio")
        }
    }

}
