//
//  ViewController.swift
//  iOS-Programmatic-UI-Lab
//
//  Created by Tsering Lama on 1/29/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var colorView = ColorsView()
    
    var redNum: CGFloat = 0.0
    var greenNum: CGFloat = 0.0
    var blueNum: CGFloat = 0.0
        
    private var scoreLabel = UILabel()
    
    var gameLabel = UILabel()
    
    var highScorelabel = UILabel()
    
    var userScore = 0
    
    var userHigh = [Int]()
    
    var buttonStacks = UIStackView()
    
    var showColor = UIView()
    
    private var highScoreLabel = ""
    
    var emptyArr = [CGFloat]()
    
    var resetButton = UIButton()
    
    override func loadView() {
        view = colorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        emptyArr = [CGFloat]()
        showColor = colorView.showColor
        addTarget()
        gameLabel.text = ""
        scoreLabel.text = "Current score"
        highScorelabel.text = "Your highschore is \(userHigh.max() ?? 0)"
        print(emptyArr.max())
}
    
    
    private func addTarget() {
        
        for button in colorView.colorButton {
            button.addTarget(self, action: #selector(checkGuess(sender:)), for: .touchUpInside)
        }
        
        colorView.resetButton.addTarget(self, action: #selector(resetGame(sender:)), for: .touchUpInside)
        
        scoreLabel = colorView.scoreLabel
        highScoreLabel = colorView.highScore.text!
        showColor.backgroundColor = generateColor()
        gameLabel = colorView.gameLabel
        buttonStacks = colorView.buttonStacks
        highScorelabel = colorView.highScore
    }
    
    public func generateColor() -> UIColor {
        redNum = CGFloat.random(in: 0...1)
        greenNum = CGFloat.random(in: 0...1)
        blueNum = CGFloat.random(in: 0...1)
        print(redNum)
        print(greenNum)
        print(blueNum)
        let myColor = UIColor(red: redNum, green: greenNum, blue: blueNum, alpha: 1)
        emptyArr.append(redNum)
        emptyArr.append(greenNum)
        emptyArr.append(blueNum)
        return myColor
    }

    
    @objc
    private func checkGuess(sender: UIButton) {
        let sortedArray = emptyArr.sorted{$0 < $1}
        switch sender.tag {
        case 0:
            if emptyArr[0] == sortedArray[2] {
                gameLabel.text = "Correct"
                userScore += 1
                scoreLabel.text = "Your score is \(userScore)"
                emptyArr = [CGFloat]()
                showColor.backgroundColor = generateColor()
            } else {
                userHigh.append(userScore)
                gameLabel.text = "Incorrect"
                buttonStacks.isHidden = true
            }
        case 1:
            if emptyArr[1] == sortedArray[2] {
                gameLabel.text = "Correct"
                userScore += 1
                scoreLabel.text = "Your score is \(userScore)"
                emptyArr = [CGFloat]()
                showColor.backgroundColor = generateColor()
            } else {
                userHigh.append(userScore)
                gameLabel.text = "Incorrect"
                buttonStacks.isHidden = true
            }
        case 2:
            if emptyArr[2] == sortedArray[2] {
                gameLabel.text = "Correct"
                userScore += 1
                scoreLabel.text = "Your score is \(userScore)"
                emptyArr = [CGFloat]()
                showColor.backgroundColor = generateColor()
            } else {
                userHigh.append(userScore)
                gameLabel.text = "Incorrect"
                buttonStacks.isHidden = true
            }
        default:
            gameLabel.text = "N/A"
        }
    }


    @objc
    private func resetGame(sender: UIButton) {
        userScore = 0
        viewDidLoad()
        buttonStacks.isHidden = false
    }
}

