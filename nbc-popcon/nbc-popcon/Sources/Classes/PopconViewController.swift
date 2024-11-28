//
//  PopconViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/28/24.
//

import UIKit

class PopconViewController: UIViewController {
    
    let myText:String
    
    init(_ myText: String) {
        self.myText = myText
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

