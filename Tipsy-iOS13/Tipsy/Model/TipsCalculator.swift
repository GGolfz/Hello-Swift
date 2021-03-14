//
//  TipsCalculator.swift
//  Tipsy
//
//  Created by GGolfz on 14/3/2564 BE.
//  Copyright © 2564 BE The App Brewery. All rights reserved.
//

import Foundation

struct TipsCalculator {
    var bill:Float?
    var tipsPercent:Float?
    var split:Int?
    var tipsValue:Float?
    init(){
        bill = 0
        tipsPercent = 0.1
        split = 2
    }
    mutating func billChange(_ bill:Float) {
        self.bill = bill
    }
    mutating func percentChange(_ percent:Float) {
        self.tipsPercent = percent
    }
    mutating func splitChange(_ split:Int) {
        self.split = split
    }
    mutating func calculateTips() {
        self.tipsValue = (bill!*tipsPercent!)/Float(split ?? 2)
    }
    func getBill() -> Float{
        return bill ?? 0
    }
    func getPercent() -> Float {
        return tipsPercent ?? 0
    }
    func getSplit() -> Int {
        return split ?? 2
    }
    func getTips() -> Float {
        return tipsValue ?? 0
    }
}
