//
//  GlobalModalViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/28/24.
//

import UIKit


class GlobalModalViewController: UIViewController {
    
    let targetView: UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    init(target: UIView){
        self.targetView = target
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI() {
        view.addSubview(targetView)
        view.backgroundColor = ThemeColors.orange
    }
    
    
}
