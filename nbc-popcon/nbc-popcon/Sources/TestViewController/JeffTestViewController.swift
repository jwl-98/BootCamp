//
//  JeffTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/25/24.
//

import UIKit
import SnapKit

class JeffTestViewController: UIViewController {
    
    let sample: UIView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(sample)
        
        configUI()
    }

    func configUI() {
        sample.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).inset(10)
            $0.trailing.equalTo(view.snp.trailing).inset(10)
            $0.bottom.equalTo(view.snp.bottom).inset(100)
            $0.height.equalTo(571)
        }
    }
}

