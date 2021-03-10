//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    let eggTime = ["Soft":300,"Medium":420,"Hard":720]
    var totalTime = 60
    var secondPass = 0
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func handleSelectEgg(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        progressBar.progress = 0
        totalTime = eggTime[hardness]!
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if(secondPass < totalTime) {
            print("Remained Time: \(totalTime - secondPass)")
            progressBar.progress = Float(secondPass)/Float(totalTime)
            secondPass += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE"
        }
    }

}
