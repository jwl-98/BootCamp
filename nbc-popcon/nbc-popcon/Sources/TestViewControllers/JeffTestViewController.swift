//
//  JeffTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/26/24.
//
import UIKit
import SnapKit

class JeffTestViewController: UIViewController {
  
    private let cartView: UIView = CartView()
    private var bottomSheetHeight: CGFloat = 80
    
    // backgroundView
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        return view
    }()
    
    // bottomSheet View
    private let bottomSheetView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewLayout()
       
    }
    //MARK: - Layout setting
    private func setupViewLayout() {
        view.addSubview(backgroundView)
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(cartView)
        
        // backgroundView Layout
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        // bottomSheetView Layout
        bottomSheetView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(200)   //뷰컨트롤 높이 조절
        }
      
        // insertView Layout
        cartView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    //MARK: - 모달 애니메이션 부분
    
    // 아직 구현 중
    func showBottomSheet() {
        UIView.animate(withDuration: 0.3, animations: {
                   self.backgroundView.alpha = 1.0
                   self.bottomSheetView.snp.updateConstraints {
                       $0.bottom.equalToSuperview()
                   }
                   self.view.layoutIfNeeded()
               })
    }
    
    func hideBottomSheet() {
        UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundView.alpha = 0.0
                    self.bottomSheetView.snp.updateConstraints {
                        $0.bottom.equalToSuperview().offset(self.bottomSheetHeight)
                    }
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.dismiss(animated: false)
                })
    }
    
    
    func updateBottomSheetLayout() {
        bottomSheetView.snp.remakeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(self.view.frame.height - self.bottomSheetHeight)
        }
    }
    
    @objc func hideBottomSheetAction() {
        hideBottomSheet()
    }
}

 
//#Preview {
//    JeffTestViewController()
//}
