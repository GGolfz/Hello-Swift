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
    var currentHeight:Float = 1.5
    var currentWeight:Float = 100
    var currentBMI:Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = currentHeight
        weightSlider.value = currentWeight
    }
    func roundTo2DecimalPlace(_ num:Float) -> Float {
        return round(num*100)/100
    }
    @IBAction func heightChange(_ sender: UISlider) {
        currentHeight = roundTo2DecimalPlace(sender.value)
        heightText.text = "\(currentHeight)m"
    }
    
    @IBAction func weightChange(_ sender: UISlider) {
        currentWeight = round(sender.value)
        weightText.text = "\(currentWeight)Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        currentBMI = currentWeight/pow(currentHeight,2)
        print(currentBMI)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = currentBMI
        }
    }
}

