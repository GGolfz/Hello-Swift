//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by GGolfz on 14/3/2564 BE.
//  Copyright © 2564 BE Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var height:Float
    var weight:Float
    var bmi:BMI?
    init(height:Float,weight:Float) {
        self.height = height
        self.weight = weight
    }
    mutating func changeHeight(_ height:Float){
        self.height = roundTo2DecimalPlace(height)
    }
    mutating func changeWeight(_ weight:Float){
        self.weight = round(weight)
    }
    mutating func calculateBMI() {
        self.bmi = BMI(weight/(pow(height,2)))
    }
    func roundTo2DecimalPlace(_ number:Float) -> Float {
        return round(number*100)/100
    }
    func getHeight() -> Float{
        return height
    }
    func getWeight() -> Float {
        return weight
    }
    func getBMI() -> BMI {
        return bmi!
    }
}
