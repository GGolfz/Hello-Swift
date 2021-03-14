//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    var calculationBrain:CalculatorBrain = CalculatorBrain(height: 1.5, weight: 100)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = calculationBrain.getHeight()
        weightSlider.value = calculationBrain.getWeight()
    }
    func roundTo2DecimalPlace(_ num:Float) -> Float {
        return round(num*100)/100
    }
    @IBAction func heightChange(_ sender: UISlider) {
        calculationBrain.changeHeight(sender.value)
        heightText.text = "\(calculationBrain.getHeight())m"
    }
    
    @IBAction func weightChange(_ sender: UISlider) {
        calculationBrain.changeWeight(sender.value)
        weightText.text = "\(calculationBrain.getWeight())Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        calculationBrain.calculateBMI()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let ResultVC = segue.destination as! ResultViewController
            ResultVC.bmiValue = calculationBrain.getFormattedBMI()
        }
    }
}

