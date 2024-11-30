//
//  GlobalTestView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/29/24.
//

import UIKit
import SnapKit

class GlobalTestView: UIView {
    
    let button = UIButton()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        self.backgroundColor = ThemeColors.yellow
        
        button.setTitle("Test", for: .normal)
        button.setTitleColor(ThemeColors.blue, for: .normal)
        button.backgroundColor = ThemeColors.red
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(button)
        
        label.text = "waiting"
        label.textColor = ThemeColors.blue
        self.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(80)
        }
        
    }
    
    @objc func buttonTapped() {
        print("hello")
        guard let topVC = AppHelpers.getTopViewController() as? GlobalModalViewController else {
            return
        }
        
        print(topVC)
        
    }
    
    
}
