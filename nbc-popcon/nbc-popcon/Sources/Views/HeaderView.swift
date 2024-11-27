//
//  HeaderView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    // MARK: - UI Components
    
    // 서비스명 라벨
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = ThemeFonts.h1bold
        titleLabel.text = "POPCON"
        titleLabel.textColor = ThemeColors.white // 초기 라이트 모드 색상 유지
        return titleLabel
    }()
    
    // 호출 버튼
    private let callButton: UIButton = {
        let callButton = UIButton()
        let callImage = UIImage(systemName: "bell.fill")
        callButton.setImage(callImage, for: .normal)
        callButton.contentMode = .scaleAspectFit
        callButton.backgroundColor = .clear
        callButton.tintColor = ThemeColors.white // 초기 라이트 모드 색상 유지
        return callButton
    }()
    
    // MARK: - Callback
    
    /// 직원 호출 이벤트 전달 클로저
    var onCallStaff: (() -> Void)? = nil
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI() // UI 초기화
        configureCallButtonAction() // 호출 버튼 액션 설정
        applyTheme() // 초기 테마 적용
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
        configureCallButtonAction()
        applyTheme()
    }
}

// MARK: - HeaderView (UI 설정)

extension HeaderView {
    
    /// UI 초기 설정 메서드
    private func setUpUI() {
        setUpTitleLabel()
        setUpCallButton()
        self.backgroundColor = ThemeColors.red // 초기 라이트 모드 색상 유지
    }
    
    /// 서비스명 라벨 설정
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.bottom.equalToSuperview().inset(20)
        }
    }
    
    /// 호출 버튼 설정
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

// MARK: - HeaderView (직원 호출 액션 설정)

extension HeaderView {
    
    /// 버튼 액션 연결
    private func configureCallButtonAction() {
        self.callButton.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
    }
    
    /// 호출 버튼 탭 이벤트 처리
    @objc private func callButtonTapped() {
        guard let onBellButtonTapped = self.onCallStaff else { return }
        onBellButtonTapped()
    }
}

// MARK: - 테마 변경 메서드 추가

extension HeaderView {
    /// 테마에 따라 UI를 업데이트합니다.
    func updateTheme(to theme: UIUserInterfaceStyle) {
        switch theme {
        case .light:
            // 라이트 모드: 초기 색상 유지
            self.backgroundColor = ThemeColors.red
            titleLabel.textColor = ThemeColors.white
            callButton.tintColor = ThemeColors.white
        case .dark:
            // 다크 모드: 다크 색상 적용
            self.backgroundColor = .black
            titleLabel.textColor = .white
            callButton.tintColor = .white
        default:
            // 시스템 설정에 따른 테마 적용
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            self.backgroundColor = isDarkMode ? .black : ThemeColors.red
            titleLabel.textColor = isDarkMode ? .white : ThemeColors.white
            callButton.tintColor = isDarkMode ? .white : ThemeColors.white
        }
    }

    /// 현재 테마 상태에 따라 즉시 적용
    private func applyTheme() {
        let currentTheme = traitCollection.userInterfaceStyle
        updateTheme(to: currentTheme)
    }
}

#Preview {
    ViewController()
}
