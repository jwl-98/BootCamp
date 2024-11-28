//
//  SeongtoTestViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/26/24.
//

import UIKit
import SnapKit


class SeongtoTestViewController: PopconViewController {
    let label: UILabel = UILabel()
    let button: UIButton = UIButton()
    let button2: UIButton = UIButton()
        
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
        
        view.backgroundColor = ThemeColors.orange
        
        label.text = myText
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
            $0.top.equalToSuperview().offset(100)
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
        print(self)
        guard let topVC = AppHelpers.getTopViewController() as? SeongtoTestViewController else {
            return
        }
        
        print(topVC)
        print(topVC.myText)
    }
    
    @objc func tapAction2() {
//        guard let topVC = AppHelpers.getTopViewController() else {
//            return
//        }
//        
//        let newVC = UIViewController()
//        newVC.modalPresentationStyle = .overFullScreen
//        newVC.view.backgroundColor = ThemeColors.black.withAlphaComponent(0.5)
//        newVC.modalTransitionStyle = .crossDissolve
//        
//        let miniLabel = UILabel()
//        miniLabel.text = "Hello"
//        miniLabel.backgroundColor = .red
//        newVC.view.addSubview(miniLabel)
//        
//        miniLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(100)
//            make.height.equalTo(100)
//        }
//        
//        
//        topVC.present(newVC, animated: true, completion: nil)
//        
//        
        
        
        let modalView = ModalManager.createGlobalModal( MenuView() )
    }
}

#Preview {
    SeongtoTestViewController()
}
