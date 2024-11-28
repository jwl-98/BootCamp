//
//  ColorSampleViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/28/24.
//


import UIKit
import SnapKit


class ColorSampleViewController: PopconViewController {
    
    let viewLabel = UIView()
    let viewSecondary = UIView()
    let viewTertiary = UIView()
    let viewQuaternary = UIView()
    let viewPlaceholder = UIView()
    let viewSeparator = UIView()
    let viewOpaque = UIView()
    let viewLink = UIView()
    let viewFill = UIView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    init() {
        super.init("AAAA BBBB")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configUI() {
        
        view.backgroundColor = UIColor.systemBackground
        
        viewLabel.backgroundColor = .label
        viewSecondary.backgroundColor = .secondaryLabel
        viewTertiary.backgroundColor = .tertiaryLabel
        viewQuaternary.backgroundColor = .quaternaryLabel
        viewPlaceholder.backgroundColor = .placeholderText
        viewSeparator.backgroundColor = .separator
        viewOpaque.backgroundColor = .opaqueSeparator
        viewLink.backgroundColor = .link
        viewFill.backgroundColor = .systemFill
        
        
        [
            viewLabel,
            viewSecondary,
            viewTertiary,
            viewQuaternary,
            viewPlaceholder,
            viewSeparator,
            viewOpaque,
            viewLink,
            viewFill
        ].map { view.addSubview($0) }
        
        viewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(100)
        }
        
        viewSecondary.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewLabel.snp.bottom).offset(10)
        }
        
        viewTertiary.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewSecondary.snp.bottom).offset(10)
        }
        
        viewQuaternary.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewTertiary.snp.bottom).offset(10)
        }
        
        viewPlaceholder.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewQuaternary.snp.bottom).offset(10)
        }
        
        viewSeparator.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewPlaceholder.snp.bottom).offset(10)
        }
        
        viewOpaque.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewSeparator.snp.bottom).offset(10)
        }
        
        viewLink.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewOpaque.snp.bottom).offset(10)
        }
        
        viewFill.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(viewLink.snp.bottom).offset(10)
        }
    }
}

#Preview {
    ColorSampleViewController()
}
