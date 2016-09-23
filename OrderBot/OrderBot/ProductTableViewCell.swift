//
//  ProductTableViewCell.swift
//  OrderBot
//
//  Created by Christopher Tao on 4/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var ProductCategoryLabel: UILabel!
    @IBOutlet weak var productUnitLabel: UILabel!
    @IBOutlet weak var productStockLevelLabel: UILabel!
    
    var productObject: Product = Product()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
