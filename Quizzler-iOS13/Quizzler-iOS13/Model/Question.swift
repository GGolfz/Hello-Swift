//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by GGolfz on 13/3/2564 BE.
//  Copyright © 2564 BE The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answer: String
    init(q:String, a:String){
        self.question = q
        self.answer = a
    }
}
