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
    
    static func getAll() -> [Category]! {
        do {
            let realm = try Realm()
            let categoryList = realm.objects(Category.self).toArray()
            return categoryList
        }catch {
            print(error)
        }
        return [Category]()
    }
    
    static func addNewCategory(_ categoryDesc: String) -> Bool {
        do {
            let realm = try Realm()
            let newCategory = Category(value: [UUID().uuidString, categoryDesc, [SubCategory]()])
            if realm.objects(Category.self).filter("desc = '\(categoryDesc)'").count > 0 {
                return false
            }
            try realm.write({
                realm.add(newCategory)
            })
        }catch {
            print(error)
            return false
        }
        return true
    }
    
    static func deleteSelf(_ category: Category) -> Bool {
        do {
            let realm = try Realm()
            try realm.write{
                realm.delete(category)
            }
        }catch {
            print(error)
            return false
        }
        return true
    }
}
