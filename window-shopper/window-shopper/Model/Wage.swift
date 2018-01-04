//
//  Wage.swift
//  window-shopper
//
//  Created by Nan on 2018/1/4.
//  Copyright © 2018年 nan. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
