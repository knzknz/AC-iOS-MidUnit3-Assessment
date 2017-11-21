//
//  Question.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct Question: Codable {
    let answer: String?
    let question: String?
    let category: [BookCategory] //may be nil
    let value: Int?
}
   //init(answer: String?, question: String?, category: String?, value: Int?) {
//        self.answer = answer
//        self.question = question
//        self.category = category
//        self.value = value
   // }

struct BookCategory: Codable {
    let title: String
}


