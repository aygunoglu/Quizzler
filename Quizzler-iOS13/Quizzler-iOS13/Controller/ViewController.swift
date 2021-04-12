//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Hasan Aygünoglu on 1.04.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    

    var quizBrain = QuizBrain()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            print("Right!!")
        }
        else {
            sender.backgroundColor  = UIColor.red
            print("Wrong :(")
        }
        
        quizBrain.nextQuestion()
        
        perform(#selector(updateUI), with: nil, afterDelay: 0.2)

        //updateUI()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
}

