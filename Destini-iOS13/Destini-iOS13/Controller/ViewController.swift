//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        let data = storyBrain.getCurrentData()
        storyLabel.text = data.title
        choice1Button.setTitle(data.choice1, for: UIControl.State.normal)
        choice2Button.setTitle(data.choice2, for: UIControl.State.normal)
    }
    @IBAction func handleChoose(_ sender: UIButton) {
        storyBrain.changeStory(selection: sender.currentTitle!)
        updateUI()
    }
    
}

