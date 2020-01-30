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
    
    public lazy var showColor: UIView = {
       let colorView = UIView()
        colorView.backgroundColor = generateColor()
       return colorView
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
    }
    
    private func generateColor() -> UIColor {
        redNum = CGFloat.random(in: 0...1)
        greenNum = CGFloat.random(in: 0...1)
        blueNum = CGFloat.random(in: 0...1)
        let myColor = UIColor(red: redNum, green: greenNum, blue: blueNum, alpha: 1)
        return myColor
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
