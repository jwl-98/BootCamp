//
//  JWTestVCViewController.swift
//  nbc-popcon
//
//  Created by 진욱의 Macintosh on 11/26/24.
//

import UIKit

class JWTestVCViewController: UIViewController {
    let oderButtonsViews = ButtonsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = oderButtonsViews
        setAddTarget()
    }
    
    func setAddTarget() {
        oderButtonsViews.purchaseButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func cancelButtonTapped(sender: UIButton) {
        sender.alpha = 0.5
        let alert = UIAlertController(title: "결제하기", message: "결제하시겠어요?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        present(alert, animated: true, completion: nil)
        
    }
}

#Preview {
    JWTestVCViewController()
}

