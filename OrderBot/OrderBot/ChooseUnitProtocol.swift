//
//  ChooseUnitProtocol.swift
//  OrderBot
//
//  Created by Christopher Tao on 18/08/2016.
//  Copyright © 2016 Christopher Tao. All rights reserved.
//

import Foundation

protocol ChooseUnitProtocol {
    func didChooseUnitWithUnit(unit: Unit) -> Void
}