//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by GGolfz on 14/3/2564 BE.
//  Copyright © 2564 BE Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue:BMI?
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value:Float = bmiValue?.getValue() ?? 0
        valueLabel.text = String(format: "%0.2f", value)
        suggestionLabel.text = bmiValue?.getSuggestion()
        resultBackground.backgroundColor = bmiValue?.getColor()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculatePress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
