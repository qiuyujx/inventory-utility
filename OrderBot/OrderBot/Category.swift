//
//  Category.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var id: String = ""
    dynamic var desc: String = ""
    let subCategories = List<SubCategory>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
