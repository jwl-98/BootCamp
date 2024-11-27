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
    
    var onCompleteOrder: (() -> Void)?
    var onCancelOrder: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        completeButtonAction()
        cancelButtonAction()
        applyTheme() // 초기 테마 적용
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        completeButtonAction()
        cancelButtonAction()
        applyTheme() // 초기 테마 적용
    }
    
    // MARK: - UI Components
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("취소하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.grey1 // 기본 라이트 모드 색상
        button.frame.size.width = 70

        return button
    }()
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("결제하기", for: .normal)
        button.titleLabel?.font = themeManager.fonts.bold
        button.layer.cornerRadius = 25
        button.backgroundColor = themeManager.colors.blue // 기본 라이트 모드 색상
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
    
    // MARK: - Layout 설정
    
    private func setupView() {
        addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - Button Actions

extension ButtonsView {
    
    private func completeButtonAction() {
        self.purchaseButton.addTarget(self,
                                      action: #selector(completeButtonTapped(_:)),
                                      for: .touchUpInside
        )
    }
    
    @objc func completeButtonTapped(_ sender: UIButton) {
        // 버튼 효과
        sender.alpha = 0.5
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        onCompleteOrder?()
    }
    
    private func cancelButtonAction() {
        self.cancelButton.addTarget(self,
                                    action: #selector(cancelButtonTapped(_:)),
                                    for: .touchUpInside
        )
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        onCancelOrder?()
    }
}

// MARK: - 테마 변경 메서드 추가

extension ButtonsView {
    /// 테마에 따라 UI를 업데이트합니다.
    func updateTheme(to theme: UIUserInterfaceStyle) {
        switch theme {
        case .light:
            // 라이트 모드: 기존 색상 유지
            self.backgroundColor = themeManager.colors.clear
            cancelButton.backgroundColor = themeManager.colors.grey1
            purchaseButton.backgroundColor = themeManager.colors.blue
        case .dark:
            // 다크 모드: 색상 변경
            self.backgroundColor = .black
            cancelButton.backgroundColor = .darkGray
            purchaseButton.backgroundColor = .systemIndigo
        default:
            // 시스템 설정에 따라 적용
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            self.backgroundColor = isDarkMode ? .black : themeManager.colors.clear
            cancelButton.backgroundColor = isDarkMode ? .darkGray : themeManager.colors.grey1
            purchaseButton.backgroundColor = isDarkMode ? .systemIndigo : themeManager.colors.blue
        }
    }
    
    /// 현재 테마 상태에 따라 즉시 적용
    private func applyTheme() {
        let currentTheme = traitCollection.userInterfaceStyle
        updateTheme(to: currentTheme)
    }
}
