//
//  SubCategory.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class SubCategory: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var id: String = ""
    let superCategory = LinkingObjects(fromType: Category.self, property: "subCategories")
    dynamic var desc: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
