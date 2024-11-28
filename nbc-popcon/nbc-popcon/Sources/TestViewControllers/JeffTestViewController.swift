//
//  JeffTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/26/24.
//
import UIKit
import SnapKit

class JeffTestViewController: UIViewController {
    
    private let modalTestView: UIView = ModalTestView()
    private var bottomSheetHeight: CGFloat = 80
    
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
        view.addSubview(modalTestView)
        
        // backgroundView Layout
        modalTestView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
    }
}
 
//#Preview {
//    JeffTestViewController()
//}
