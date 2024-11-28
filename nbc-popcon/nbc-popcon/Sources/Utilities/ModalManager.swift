//
//  ModalManager.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/28/24.
//


import UIKit


struct ModalManager {
    
    static func createGlobalModal(_ content: UIView ) -> GlobalModalViewController? {
        guard let topVC = AppHelpers.getTopViewController() else {
            return nil
        }
        
        let modalVC = GlobalModalViewController(target: content)
        modalVC.modalPresentationStyle = .overFullScreen
        modalVC.modalTransitionStyle = .crossDissolve
        
        // 구버젼 호환성을 위해 xcode에서 아래 코드 삽입을 추천.
        if #available(iOS 13.0, *) {
            modalVC.isModalInPresentation = true
        }
        
        topVC.present(modalVC, animated: true, completion: nil)
        
        return modalVC
    }
}
