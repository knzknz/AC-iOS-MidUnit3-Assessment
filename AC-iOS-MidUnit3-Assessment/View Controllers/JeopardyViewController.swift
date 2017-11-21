//
//  JeopardyViewController.swift
//  AC-iOS-MidUnit3-Assessment
//
//  Created by C4Q on 11/21/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class JeopardyViewController: UIViewController, UITextFieldDelegate {
    
    var jeopardyQuestionsArr = [Question]()
    var correctAnswer: String = ""
    
    @IBOutlet weak var jeopardyLogoImageview: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userGuessInputField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var userResultLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJeopardyData()
        reset()
    }
    
    //MARK: - Loading Jeopardy Data
    func loadJeopardyData() {
        if let path = Bundle.main.path(forResource: "jeopardyinfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                do {
                    self.jeopardyQuestionsArr = try JSONDecoder().decode([Question].self, from: data)
                    //songTableView.reloadData()
                }
                catch {
                    print("Error Decoding Data")
                    print(error)
                }
            }
        }
    }
    

    //MARK: - Text Field Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            guard let usersGuess = textField.text else {
                return false
            }
        if usersGuess == correctAnswer {
            userResultLabel.isHidden = false
            userResultLabel.text = "Correct!"
            textField.resignFirstResponder()
            return true
        } else {
            userResultLabel.text = "Wrong! The correct answer was \(correctAnswer)"
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard string.count == 1 else {
                return false
            }
            guard string != "" else {
                return false
            }
        return true
        }

    //MARK: - Button Method
    
//    @IBAction func nextQuestionButtonPressed(_ sender: UIButton) {
//        questionLabel.text = nextQuestion().question
//        valueLabel.text = String(describing: nextQuestion().value)
//        categoryLabel.text = nextQuestion().category
//
//        reset()
//    }

    func reset() {
        //labels
        userResultLabel.isHidden = true
        //correct answer is set
       // correctAnswer = nextQuestion().answer!
    }
    
//    func nextQuestion() -> Question {
//        let currentQuestion = jeopardyQuestionsArr[currentIndex - 1]
//        currentIndex += 1
//        if currentIndex == jeopardyQuestionsArr.count {
//            currentIndex = 0
//        }
//        return currentQuestion
//    }
//    private var currentIndex = 0
}


