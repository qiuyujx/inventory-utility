//
//  Product.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class Product: DataObject {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var name: String = ""
    dynamic var unit: Unit?
    
    dynamic var category: Category?
    dynamic var subCategory: SubCategory?
    
    dynamic var decimalEnabled: Bool = false
    dynamic var barcode: String?
    let price = RealmOptional<Float>()
    dynamic var comment: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
