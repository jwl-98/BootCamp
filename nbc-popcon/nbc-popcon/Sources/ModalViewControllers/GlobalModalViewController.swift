//
//  GlobalModalViewController.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/28/24.
//

import UIKit
import SnapKit


class GlobalModalViewController: UIViewController {
    
    let targetView: UIView // 모달에 보여주고자 하는 UIView
    let bgView = UIView() // 투명도 있는 모달의 배경
    let modalWindow = UIView() // 모달의 컨텐츠 윈도우
    let closeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(target: UIView){
        self.targetView = target
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        bgView.backgroundColor = ThemeColors.label.withAlphaComponent(0.6)
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabCloseBtn)))
        
        modalWindow.backgroundColor = ThemeColors.bg
        modalWindow.layer.cornerRadius = 30
        modalWindow.layer.masksToBounds = false
        modalWindow.layer.shadowColor = ThemeColors.label.cgColor
        modalWindow.layer.shadowOffset = CGSize(width: 0, height: 10)
        modalWindow.layer.shadowOpacity = 0.4

        let modalTapRecognizer = UITapGestureRecognizer(target: self, action: nil)
        modalWindow.addGestureRecognizer(modalTapRecognizer)
        
        targetView.backgroundColor = ThemeColors.bg
    
        closeBtn.backgroundColor = ThemeColors.blue
        closeBtn.setTitle("창 닫기", for: .normal)
        closeBtn.setTitleColor(ThemeColors.white, for: .normal)
        closeBtn.addTarget(self, action: #selector(tabCloseBtn), for: .touchUpInside)
        closeBtn.layer.cornerRadius = 20
        
        modalWindow.addSubview(targetView)
        modalWindow.addSubview(closeBtn)
        bgView.addSubview(modalWindow)
        view.addSubview(bgView)
        
        
        bgView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        modalWindow.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(ThemeNumbers.paddingBig)
            make.top.bottom.equalToSuperview().inset(200)
        }
        
        closeBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().inset(ThemeNumbers.padding)
            
        }
        
        targetView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            make.top.equalToSuperview().inset(ThemeNumbers.padding)
            make.bottom.equalTo(closeBtn.snp.top).offset(-20)
        }
        
        
    }
    
    func closeModal() {
        self.dismiss(animated: true)
    }
    
    @objc func tabCloseBtn() {
        closeModal()
    }
    
    
}
