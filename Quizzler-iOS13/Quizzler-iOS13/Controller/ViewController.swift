//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    @IBAction func answerQuestion(_ sender: UIButton) {
        let answer = sender.currentTitle!
        if(quizBrain.checkAnswer( answer)){
            quizBrain.increaseScore()
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.changeQuestion()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: true)
    }
    @objc func changeQuestion(){
        questionText.text = quizBrain.getQuestion()
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor =  UIColor.clear
        progressBar.progress = quizBrain.getCurrentProgress()
        scoreLabel.text = "Score: \(quizBrain.getCurrentScore())"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        changeQuestion()
    }


}

