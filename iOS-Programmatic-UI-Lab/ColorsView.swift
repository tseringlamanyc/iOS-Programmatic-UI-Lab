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
    
    public lazy var showColor: UIView = {
       let colorView = UIView()
       colorView.backgroundColor = generateColor()
       return colorView
    }()
    
    public lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public lazy var colorButton: [UIButton] = {
       var buttons = [UIButton]()
        let redButton = UIButton()
        redButton.tag = 0
        redButton.addTarget(self, action: #selector(checkGuess(sender:)), for: .touchUpInside)
        let greenButton = UIButton()
        greenButton.tag = 1
        greenButton.addTarget(self, action: #selector(checkGuess(sender:)), for: .touchUpInside)
        let blueButton = UIButton()
        greenButton.tag = 2
        blueButton.addTarget(self, action: #selector(checkGuess(sender:)), for: .touchUpInside)
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
    }
    
    private func generateColor() -> UIColor {
        redNum = CGFloat.random(in: 0...1)
        greenNum = CGFloat.random(in: 0...1)
        blueNum = CGFloat.random(in: 0...1)
        let myColor = UIColor(red: redNum, green: greenNum, blue: blueNum, alpha: 1)
        emptyArr.append(redNum)
        emptyArr.append(greenNum)
        emptyArr.append(blueNum)
        return myColor
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
    
    @objc
    private func checkGuess(sender: UIButton) {
        switch sender.tag {
        case 0:
            if emptyArr[0] == emptyArr.max() ?? 0 {
                gameLabel.text = "Correct"
            } else {
                gameLabel.text = "Incorrect"
            }
        case 1:
            if emptyArr[1] == emptyArr.max() ?? 0 {
                gameLabel.text = "Correct"
            } else {
                gameLabel.text = "Incorrect"
            }
        case 2:
            if emptyArr[2] == emptyArr.max() ?? 0 {
                gameLabel.text = "Correct"
            } else {
                gameLabel.text = "Incorrect"
            }
        default:
            gameLabel.text = "N/A"
        }
    }
}
