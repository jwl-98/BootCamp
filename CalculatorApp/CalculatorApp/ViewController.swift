//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 진욱의 Macintosh on 11/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    let calculatorView = CalculatorView()
    override func loadView() {
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorView.mainLabel.text = "0" //기본텍스트 0
    }


}

