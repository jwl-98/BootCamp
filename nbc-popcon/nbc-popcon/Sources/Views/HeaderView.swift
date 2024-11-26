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
        
        titleLabel.font = ThemeManager.shared.fonts.h2
        titleLabel.text = "POPCON"
        titleLabel.textColor = .white

        return titleLabel
    }()
    
    private let bellButton: UIButton = {
        let callButton = UIButton()
        
        let callImage = UIImage(systemName: "bell.fill")
        callButton.setImage(callImage, for: .normal)
        callButton.contentMode = .scaleAspectFit
        callButton.backgroundColor = .clear
        callButton.tintColor = .white
        
        return callButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
}


//MARK: - HeaderView (setUpUI)
extension HeaderView {
    
    private func setUpUI() {
        setUpTitleLabel()
        setUpBellButton()
        self.backgroundColor = .red
    }
    
    private func setUpTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { label in
            label.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setUpBellButton() {
        self.addSubview(bellButton)
        
        bellButton.snp.makeConstraints { button in
            button.centerY.equalTo(titleLabel)
            button.trailing.equalToSuperview().inset(ThemeManager.shared.numbers.padding)
            button.height.width.equalTo(32)
        }
        
        bellButton.imageView?.snp.makeConstraints { imageView in
            imageView.size.centerX.centerY.equalToSuperview()
        }
    }
}
