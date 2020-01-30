//
//  ColorsView.swift
//  iOS-Programmatic-UI-Lab
//
//  Created by Tsering Lama on 1/29/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class ColorsView: UIView {
    
    var redNum: CGFloat = 0.0
    var greenNum: CGFloat = 0.0
    var blueNum: CGFloat = 0.0
    
    var emptyArr = [CGFloat]()
    
    var userScore = 0
    
    var userHigh = [Int]()
    
    public lazy var showColor: UIView = {
        let colorView = UIView()
        return colorView
    }()
    
    public lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var highScore: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    public lazy var colorButton: [UIButton] = {
        var buttons = [UIButton]()
        let redButton = UIButton()
        redButton.tag = 0
        let greenButton = UIButton()
        greenButton.tag = 1
        let blueButton = UIButton()
        greenButton.tag = 2
        buttons.append(redButton)
        buttons.append(greenButton)
        buttons.append(blueButton)
        return buttons
    }()
    
    public lazy var buttonStacks: UIStackView = {
        let stackViews = UIStackView(arrangedSubviews: colorButton)
        stackViews.arrangedSubviews[0].backgroundColor = .systemRed
        stackViews.arrangedSubviews[1].backgroundColor = .systemGreen
        stackViews.arrangedSubviews[2].backgroundColor = .systemBlue
        return stackViews
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpColorView()
        setUpStacks()
        setUpLabel()
        setUpScoreLabel()
        highScoreLabel()
        resetSetUp()
        gameLabel.text = "Hello, Press the button to play"
        scoreLabel.text = "Your score"
        highScore.text = "High score is \(userHigh.max() ?? 0)"
    }
    
    private func resetSetUp() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: highScore.bottomAnchor, constant: 40)
        ])
    }
    
    private func setUpLabel() {
        addSubview(gameLabel)
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: buttonStacks.bottomAnchor, constant: 20),
            gameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            gameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func highScoreLabel() {
        addSubview(highScore)
        highScore.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highScore.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            highScore.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            highScore.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpScoreLabel() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: gameLabel.bottomAnchor, constant: 20),
            scoreLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpStacks() {
        addSubview(buttonStacks)
        buttonStacks.translatesAutoresizingMaskIntoConstraints = false
        buttonStacks.axis = .horizontal
        buttonStacks.distribution = .fillEqually
        buttonStacks.alignment = .fill
        buttonStacks.spacing = 100
        NSLayoutConstraint.activate([
            buttonStacks.topAnchor.constraint(equalTo: showColor.bottomAnchor, constant: 40),
            buttonStacks.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStacks.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setUpColorView() {
        addSubview(showColor)
        showColor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showColor.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            showColor.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            showColor.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            showColor.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
}
