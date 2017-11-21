//
//  Question.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class Question: Codable {
    let answer: String?
    let question: String?
    let category: String? //may be nil
    let value: Int?
    init(answer: String?, question: String?, category: String?, value: Int?) {
        self.answer = answer
        self.question = question
        self.category = category
        self.value = value
    }

//    convenience init?(from jsonDict: [String:Any]) {
//        guard let question = (jsonDict["question"] as? String) else {return nil}
//        guard let answer = (jsonDict["answer"] as? String) else {return nil}
//        let category = (jsonDict["category"] as? String) ?? "category not available"
//        let value = jsonDict["value"] as? Int ?? 0
//       self.init(answer: answer, question: question, category: category, value: value)
//    }

}


