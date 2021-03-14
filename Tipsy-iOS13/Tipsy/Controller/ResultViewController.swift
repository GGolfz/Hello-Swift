//
//  ResultViewController.swift
//  Tipsy
//
//  Created by GGolfz on 14/3/2564 BE.
//  Copyright © 2564 BE The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var valueText: UILabel!
    var tipsValue:Float?
    var splitter:Int?
    var percent:Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        valueText.text = String(format: "%0.2f", tipsValue!)
        descriptionText.text = "Split between \(splitter!) people, with \(round(percent!*100))% tip."
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func reCalculate(_ sender: Any) {
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
