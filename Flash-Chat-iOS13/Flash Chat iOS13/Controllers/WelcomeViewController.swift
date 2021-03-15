//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        let data = ["⚡️","F","l","a","s","h","C","h","a","t"]
        var text = ""
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) {timer in
            text += data[count]
            self.titleLabel.text = text
            count += 1
            if(count == data.capacity){
                timer.invalidate()
            }
        }
       
    }
    

}
