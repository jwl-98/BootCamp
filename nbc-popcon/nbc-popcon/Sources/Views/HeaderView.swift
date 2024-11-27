//
//  HeaderView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.font = ThemeFonts.h1bold
        titleLabel.text = "POPCON"
        titleLabel.textColor = ThemeColors.white

        return titleLabel
    }()
    
    private let callButton: UIButton = {
        let callButton = UIButton()
        
        let callImage = UIImage(systemName: "bell.fill")
        callButton.setImage(callImage, for: .normal)
        callButton.contentMode = .scaleAspectFit
        callButton.backgroundColor = .clear
        callButton.tintColor = ThemeColors.white
        
        return callButton
    }()
    
    var onCallStaff: (() -> (Void))? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
        configureCallButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
        configureCallButtonAction()
    }
}


//MARK: - HeaderView (setUpUI)
extension HeaderView {
    
    private func setUpUI() {
        setUpTitleLabel()
        setUpCallButton()
        self.backgroundColor = ThemeColors.red
    }
    
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { label in
            label.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setUpCallButton() {
        self.addSubview(callButton)
        
        callButton.snp.makeConstraints { button in
            button.centerY.equalTo(titleLabel)
            button.trailing.equalToSuperview().inset(ThemeManager.shared.numbers.padding)
            button.height.width.equalTo(25)
        }
        
        callButton.imageView?.snp.makeConstraints { imageView in
            imageView.size.centerX.centerY.equalToSuperview()
        }
    }
}

//MARK: - HeaderView 직원 호출 버튼
extension HeaderView {
    
    private func configureCallButtonAction() {
        self.callButton.addTarget(nil, action: #selector(callButtonTapped), for: .touchUpInside)
    }
    
    @objc private func callButtonTapped() {
        guard let onBellButtonTapped = self.onCallStaff else { return }
        onBellButtonTapped()
    }
}
