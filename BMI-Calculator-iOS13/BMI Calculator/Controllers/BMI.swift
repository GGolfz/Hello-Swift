//
//  BMI.swift
//  BMI Calculator
//
//  Created by GGolfz on 14/3/2564 BE.
//  Copyright © 2564 BE Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    var value:Float
    var suggestion:String?
    var color:UIColor?
    init(_ bmi:Float){
        self.value = bmi;
        if(value < 18.5) {
            self.color = UIColor.green
            self.suggestion = "Eat more pies!"
        } else if (value < 25){
            self.color = UIColor.blue
            self.suggestion = "Fit as a fiddle!"
        } else if (value >= 25){
            self.color = UIColor.red
            self.suggestion = "Eat less pies!"
        }
    }
    func getValue() -> Float {
        return value
    }
    func getSuggestion() -> String {
        return suggestion ?? "No Advice"
    }
    func getColor() -> UIColor {
        return color ?? UIColor.blue
    }
}
