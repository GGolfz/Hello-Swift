//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var zeroTips: UIButton!
    @IBOutlet weak var tenTips: UIButton!
    @IBOutlet weak var twentyTips: UIButton!
    @IBOutlet weak var splitterText: UILabel!
    var tipsCalculator:TipsCalculator = TipsCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func finishEditingBill(_ sender: UITextField) {
        let value = sender.text! as NSString
        tipsCalculator.billChange(value.floatValue)
    }
    @IBAction func handleChangeTip(_ sender: UIButton) {
        billTextField.endEditing(true)
        if(sender.currentTitle == "0%"){
            tipsCalculator.percentChange(0)
            zeroTips.isSelected = true
            tenTips.isSelected = false
            twentyTips.isSelected = false
        } else if(sender.currentTitle == "10%"){
            tipsCalculator.percentChange(0.1)
            tenTips.isSelected = true
            zeroTips.isSelected = false
            twentyTips.isSelected = false
            
        } else if(sender.currentTitle == "20%"){
            tipsCalculator.percentChange(0.2)
            twentyTips.isSelected = true
            tenTips.isSelected = false
            zeroTips.isSelected = false
        }
    }
    @IBAction func changeStepper(_ sender: UIStepper) {
        billTextField.endEditing(true)
        tipsCalculator.splitChange(Int(sender.value))
        splitterText.text = String(Int(sender.value))
        
    }
    @IBAction func handleCalculate(_ sender: UIButton) {
        billTextField.endEditing(true)
        tipsCalculator.calculateTips()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let resultVC = segue.destination as! ResultViewController
            resultVC.tipsValue = tipsCalculator.getTips()
            resultVC.percent = tipsCalculator.getPercent()
            resultVC.splitter = tipsCalculator.getSplit()
        }
    }

}

