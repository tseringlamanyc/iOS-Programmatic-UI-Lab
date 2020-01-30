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
    
    override func loadView() {
        view = colorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }


}

