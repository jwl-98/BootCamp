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
    
    private let radioButtons: ALRadioGroup = {
        let items: [ALRadioItem] = ThemeMode
            .allCases
            .map { ALRadioItem(title: $0.rawValue) }
        
        
        let radioGroup = ALRadioGroup(items: items,
                                      style: .grouped)
        
        radioGroup.titleFont = ThemeFonts.p
        radioGroup.axis = .vertical
        radioGroup.selectedIndex = 0
        radioGroup.addTarget(self, action: #selector(buttonTapped), for: .valueChanged)
        
//        radioGroup.
        
        return radioGroup
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(_ sender: ALRadioGroup) {
        let index = sender.selectedIndex
        let themeMode = ThemeMode.allCases[index]
        
        ThemeMode.onThemeChoice?(themeMode)
    }
    
    private func setUpUI() {
        [titleLabel, radioButtons].forEach {
            addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { label in
            label.top.leading.equalToSuperview().inset(ThemeNumbers.padding)
        }
        
        radioButtons.snp.makeConstraints { buttons in
            buttons.top.equalTo(titleLabel).inset(ThemeNumbers.padding * 3)
        }
    }
    
}


class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = ThemeSelectView()
        self.view.addSubview(view)
        view.snp.makeConstraints {
            $0.bottom.trailing.leading.top.equalToSuperview().inset(ThemeNumbers.padding)
        }
    }
}

#Preview("TestViewController") {
    TestViewController()
}
