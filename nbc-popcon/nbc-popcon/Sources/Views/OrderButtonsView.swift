//
//  ButtonsView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class ButtonsView: UIView {
    let themeManager = ThemeManager()
    
    var onCompleteOrder: (() -> (Void))?
    var onCancelOrder: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buttonStackView)
        setStackViewAutoLayOut()
        completeButtonAction()
        cancelButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("취소하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.grey1
        button.frame.size.width = 70

        return button
    }()
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("결제하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.blue
        button.frame.size.width = 70

        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [cancelButton, purchaseButton])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.backgroundColor = themeManager.colors.clear
        st.spacing = themeManager.numbers.padding
        return st
    }()
    
    func setStackViewAutoLayOut() {
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).inset(0)
            $0.trailing.equalTo(self.snp.trailing).inset(0)
            $0.height.equalTo(50)
        }
    }
}

extension ButtonsView {
    
     private func completeButtonAction() {
         self.purchaseButton.addTarget(self,
                                       action: #selector(completeButtonTapped(_:)),
                                       for: .touchUpInside
         )
    }
    
    @objc  func completeButtonTapped(_ sender: UIButton) {
        //버튼효과
        sender.alpha = 0.5
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    sender.alpha = 1.0
                }
        onCompleteOrder?()
    }
    
    private func cancelButtonAction() {
        self.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        cancelButton.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    sender.alpha = 1.0
                }
        onCancelOrder?()
    }
}

