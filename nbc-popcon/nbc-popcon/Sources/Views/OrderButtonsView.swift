//
//  ButtonsView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class ButtonsView: UIView {
    let theme = ThemeManager()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonStackView)
        setStackViewAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("취소하기", for: .normal)
        button.titleLabel?.font = theme.fonts.h4
        button.layer.cornerRadius = 30
        button.backgroundColor = theme.colors.grey1
        button.frame.size.width = 70

        return button
    }()
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("결제하기", for: .normal)
        button.titleLabel?.font = theme.fonts.h4
        button.layer.cornerRadius = 30
        button.backgroundColor = theme.colors.blue
        button.frame.size.width = 70

        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [cancelButton, purchaseButton])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.backgroundColor = theme.colors.red
        st.spacing = theme.numbers.padding
        return st
    }()
    
    func setStackViewAutoLayOut() {
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(theme.numbers.paddingSmall)
            $0.trailing.equalTo(self.snp.trailing).inset(theme.numbers.paddingSmall)
            $0.bottom.equalTo(self.snp.bottom).inset(50)
            $0.height.equalTo(50)
        }
    }
    

}

