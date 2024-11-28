//
//  HeaderView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    // 서비스명 라벨
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.font = ThemeFonts.h1bold
        titleLabel.text = "POPCON"
        titleLabel.textColor = ThemeColors.bg

        return titleLabel
    }()
    
    private let greenBarView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.green
        return view
    }()
    
    // 호출 버튼
    private let callButton: UIButton = {
        let callButton = UIButton()
        
        let callImage = UIImage(systemName: "bell.fill")
        callButton.setImage(callImage, for: .normal)
        callButton.contentMode = .scaleAspectFit
        callButton.backgroundColor = .clear
        callButton.tintColor = ThemeColors.bg
        
        return callButton
    }()
    
    @objc private let themeButton: UIButton = {
        let themeButton = UIButton()
        let gearImage = UIImage(systemName: "gear")
        themeButton.setImage(gearImage, for: .normal)
        themeButton.tintColor = ThemeColors.bg
        
        return themeButton
    }()
    
    
    // 직원 호출 알럿 액션 - ViewController.setupBindings()를 통해 할당
    var onCallStaff: (() -> (Void))? = nil
    
    var onThemeToggle: (() -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
        configureButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - HeaderView (UI 설정)

extension HeaderView {
    
    // UI 설정 메서드
    private func setUpUI() {
        setUpGreenBarView()
        setUpTitleLabel()
        setUpCallButton()
        setUpThemeButton()
        
        self.backgroundColor = ThemeColors.red
    }
    
    // 서비스 명 라벨
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.bottom.equalTo(greenBarView).inset(ThemeNumbers.padding)
        }
    }
    
    private func setUpGreenBarView() {
        self.addSubview(greenBarView)
        
        greenBarView.snp.makeConstraints { view in
            view.leading.trailing.bottom.equalToSuperview()
            view.height.equalTo(14)
        }
    }
    
    // 직원 호출 버튼
    private func setUpCallButton() {
        self.addSubview(callButton)
        
        callButton.snp.makeConstraints { button in
            button.centerY.equalTo(titleLabel)
            button.leading.equalToSuperview().inset(ThemeNumbers.padding)
            button.height.width.equalTo(25)
        }
        
        callButton.imageView?.snp.makeConstraints { imageView in
            imageView.size.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setUpThemeButton() {
        self.addSubview(themeButton)
        
        themeButton.snp.makeConstraints { button in
            button.centerY.equalTo(titleLabel)
            button.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            button.height.width.equalTo(25)
        }
        
        themeButton.imageView?.snp.makeConstraints { imageView in
            imageView.size.centerX.centerY.equalToSuperview()
        }

    }
}


//MARK: - HeaderView (직원 호출 액션 설정)

extension HeaderView {
    
    // 버튼 액션 설정
    private func configureButtonAction() {
        self.callButton.addTarget(nil, action: #selector(callButtonTapped), for: .touchUpInside)
        self.themeButton.addTarget(nil, action: #selector(themeButtonTapped), for: .touchUpInside)
    }
    
    // 호출 알럿 버튼 액션
    @objc private func callButtonTapped() {
        guard let onBellButtonTapped = self.onCallStaff else { return }
        onBellButtonTapped()
    }
    
    // 테마 선택 버튼 설정
    @objc private func themeButtonTapped() {
        let themeSelectView = ThemeSelectView()
        ModalManager.createGlobalModal(themeSelectView)
    }
}


