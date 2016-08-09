//
//  RealmExtensions.swift
//  OrderBot
//
//  Created by Christopher Tao on 9/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}