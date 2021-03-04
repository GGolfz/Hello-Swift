//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(type: sender.titleLabel?.text ?? "")
    }
    func playSound(type: String) {
        print("Play:", type);
        let url = Bundle.main.url(forResource: type, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf:url!)
        player?.play()
        
    }
    func test() -> Int {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}

