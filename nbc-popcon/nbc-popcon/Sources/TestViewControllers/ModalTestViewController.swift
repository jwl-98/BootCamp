//
//  ModalTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/27/24.
//
import UIKit
import SnapKit


/// ModalTestViewController: UI 구성 및 이벤트 처리
class ModalTestViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let headerView = HeaderView() // 헤더 뷰 (카테고리 선택 포함)
    private let menuView = MenuView() // 메뉴 리스트 뷰
    private let cartView = CartView() // 장바구니 리스트 뷰
    private let buttonView = ButtonsView() // 하단 버튼 뷰
    
    // MARK: - ViewModel
    
    private let kiosk = Kiosk()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        kiosk.getCurrentMenuItems() // 초기 메뉴 데이터 가져오기
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // 뷰 계층구조 설정
        view.addSubview(headerView)
        view.addSubview(menuView)
        view.addSubview(cartView)
        
        
        // SnapKit을 사용해 제약조건 설정
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        menuView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.8)
        }
        
        cartView.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Bindings
    
    private func setupBindings() {
        
        
    }
}
