//
//  SeongtoTextViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/26/24.
//

import UIKit
import SnapKit

class SeongtoTextViewController: UIViewController {
    
    let testLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    
    func configUI() {
        testLabel.text = "linespacing:0 \nlineHeight:0"
        testLabel.numberOfLines = 0
        testLabel.font = ThemeFonts.h3
        testLabel.textColor = ThemeColors.white
        testLabel.backgroundColor = ThemeColors.red
        testLabel.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 7)
        testLabel.baselineAdjustment = .alignCenters
        
        view.addSubview(testLabel)
        
        testLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.snp.top).inset(200)
        }
        
    }
}

#Preview {
    SeongtoTextViewController()
}
