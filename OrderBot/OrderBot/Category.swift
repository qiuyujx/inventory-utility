//
//  Category.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class Category: DataObject {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var desc: String = ""
    let subCategories = List<SubCategory>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func addNewCategory(unitDesc: String) -> Bool {
        do {
            let realm = try Realm()
            let newUnit = Unit(value: [NSUUID().UUIDString, unitDesc])
            if realm.objects(Unit.self).filter("desc = '\(unitDesc)'").count > 0 {
                return false
            }
            try realm.write({
                realm.add(newUnit)
            })
        }catch {
            print(error)
            return false
        }
        return true
    }
}
