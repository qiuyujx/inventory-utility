//
//  DataObject.swift
//  OrderBot
//
//  Created by Christopher Tao on 18/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

class DataObject: Object {
    
    dynamic var id: String = ""

    static func getAll() -> [DataObject]! {
        do {
            let realm = try Realm()
            let list = realm.objects(DataObject).toArray()
            return list
        }catch {
            print(error)
        }
        return [DataObject]()
    }
    
    static func deleteSelf(object: DataObject) -> Bool {
        do {
            let realm = try Realm()
            try realm.write{
                realm.delete(object)
            }
        }catch {
            print(error)
            return false
        }
        return true
    }
}
