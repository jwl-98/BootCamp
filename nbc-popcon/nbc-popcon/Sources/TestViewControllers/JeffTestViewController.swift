//
//  JeffTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/26/24.
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
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
