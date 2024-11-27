//
//  SeongtoTestViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/26/24.
//

import UIKit
import SnapKit

class SeongtoTestViewController: UIViewController {
    
    let label: UILabel = UILabel()
    let button: UIButton = UIButton()
    let button2: UIButton = UIButton()
    var text:String = "AAA\nAAA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
    func configUI() {
        
        view.backgroundColor = ThemeColors.orange
        
        label.text = text
        label.backgroundColor = ThemeColors.blue
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.p
        label.numberOfLines = 0
        label.textAlignment = .center
        label.setLineSpacing(lineSpacing: 20)
        
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(ThemeColors.white, for: .normal)
        button.backgroundColor = ThemeColors.blue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        button2.setTitle("Tap2", for: .normal)
        button2.setTitleColor(ThemeColors.white, for: .normal)
        button2.backgroundColor = ThemeColors.blue
        button2.addTarget(self, action: #selector(tapAction2), for: .touchUpInside)
        
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
        }
        
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(100)
            $0.top.equalTo(label.snp.bottom).offset(100)
        }
        
        button2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(100)
            $0.top.equalTo(button.snp.bottom).offset(100)
        }
    }
    
    @objc func tapAction() {
        text += "\n"
        label.text = text
    }
    
    @objc func tapAction2() {
        text += "A"
        label.text = text
    }
}

#Preview {
    SeongtoTestViewController()
}
