//
//  ThemedView.swift
//  nbc-popcon
//
//  Created by 반성준 on 11/27/24.
//

import UIKit
import SnapKit

class ThemedView: UIView {
    
    // MARK: - UI Components
    
    private let themeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("테마 변경", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Event Handler
    
    /// 테마 변경 이벤트 전달 클로저
    var onThemeChanged: ((UIUserInterfaceStyle) -> Void)? // 테마 변경 이벤트 처리
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupActions()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        self.addSubview(themeButton)
        
        themeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        themeButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func changeTheme() {
        let alert = UIAlertController(title: "테마 선택", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "자동", style: .default, handler: { _ in
            self.onThemeChanged?(.unspecified)
        }))
        
        alert.addAction(UIAlertAction(title: "라이트 모드", style: .default, handler: { _ in
            self.onThemeChanged?(.light)
        }))
        
        alert.addAction(UIAlertAction(title: "다크 모드", style: .default, handler: { _ in
            self.onThemeChanged?(.dark)
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // 현재 ViewController를 찾아서 알럿 표시
        self.findViewController()?.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Theme Update
    
    func updateTheme(to theme: UIUserInterfaceStyle) {
        switch theme {
        case .light:
            backgroundColor = .white
        case .dark:
            backgroundColor = .black
        default:
            // 시스템 테마에 맞게 설정
            backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
        }
    }
    
    // MARK: - Helpers
    
    /// 현재 뷰가 속한 뷰 컨트롤러 반환
    private func findViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder {
            if let viewController = responder as? UIViewController {
                return viewController
            }
            nextResponder = responder.next
        }
        return nil
    }
}

//tm.
