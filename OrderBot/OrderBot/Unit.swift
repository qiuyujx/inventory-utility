//
//  Unit.swift
//  OrderBot
//
//  Created by Christopher Tao on 5/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class Unit: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var id: String = ""
    dynamic var desc: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func getAll() -> [Unit]! {
        do {
            let realm = try Realm()
            let unitList = realm.objects(Unit.self).toArray()
            return unitList
        }catch {
            print(error)
        }
        return [Unit]()
    }
    
    static func addNewUnit(_ unitDesc: String) -> Bool {
        do {
            let realm = try Realm()
            let newUnit = Unit(value: [UUID().uuidString, unitDesc])
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
    
    static func deleteSelf(_ unit: Unit) -> Bool {
        do {
            let realm = try Realm()
            try realm.write{
                realm.delete(unit)
            }
        }catch {
            print(error)
            return false
        }
        return true
    }
}
