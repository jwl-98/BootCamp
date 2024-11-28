//
//  ThemeSelectView.swift
//  nbc-popcon
//
//  Created by t2023-m0072 on 11/28/24.
//

import UIKit
import SnapKit
import ALRadioButtons

class ThemeSelectView: UIView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "테마 선택"
        titleLabel.textAlignment = .left
        titleLabel.textColor = ThemeColors.label
        titleLabel.font = ThemeFonts.h3bold
        
        return titleLabel
    }()
    
    // 테마 선택 라디오 버튼 그룹
    private let radioButtons: ALRadioGroup = {
        let items: [ALRadioItem] = ThemeMode
            .allCases
            .map { ALRadioItem(title: $0.rawValue) }
        
        let radioGroup = ALRadioGroup(items: items,
                                      style: .grouped)
        
        radioGroup.titleFont = ThemeFonts.p
        radioGroup.axis = .vertical
        radioGroup.selectedIndex = 0
        radioGroup.addTarget(nil, action: #selector(radioValueChanged), for: .valueChanged)
        radioGroup.buttonBackgroundColor = .clear
        
        return radioGroup
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - 라디오 버튼 액션

extension ThemeSelectView {
    
    @objc private func radioValueChanged(_ sender: ALRadioGroup) {
        let index = sender.selectedIndex
        let themeMode = ThemeMode.allCases[index]
        
        ThemeMode.onThemeChoice?(themeMode)
        ThemeMode.observer.forEach {
            $0.reloadInputViews()
        }
    }
}

//MARK: - UI 설정

extension ThemeSelectView {

    private func setUpUI() {
        [titleLabel, radioButtons].forEach {
            addSubview($0)
        }
        
        self.backgroundColor = ThemeColors.white
        
        titleLabel.snp.makeConstraints { label in
            label.top.leading.equalToSuperview().inset(ThemeNumbers.padding)
        }
        
        radioButtons.snp.makeConstraints { buttons in
            buttons.top.equalTo(titleLabel).inset(ThemeNumbers.padding * 3)
        }
    }
}

#Preview {
    ViewController()
}
