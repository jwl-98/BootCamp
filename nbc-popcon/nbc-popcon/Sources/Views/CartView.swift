//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//
//
import UIKit
import SnapKit

class CartView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let orderButtonsView = ButtonsView()
    
    //MARK: - 컴포넌트 생성
    
    // Background View
    private let View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        return view
    }()
  
    // 장바구니 목록을 보여주는 TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // buttons View
    private let buttonsView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.white
        // view의 상단에만 테투리를 적용
        let border = UIView()
        border.backgroundColor = .lightGray
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0 , width: view.frame.width, height: 0.5)
        view.addSubview(border)
        return view
    }()
    
    //MARK: - setting
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - 레이아웃
    
    private func setupViewLayout() {
        addSubview(View)
        buttonsView.addSubview(orderButtonsView)
        [tableView,buttonsView].forEach { View.addSubview($0) }
        
        // background Layout (inserView)
        View.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        // 테이블뷰 Layout
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalTo(buttonsView.snp.top)
        }
        
        // orderButtonsView의 스택뷰 Layout
        orderButtonsView.snp.makeConstraints {
            $0.top.equalTo(buttonsView.snp.top).inset(40)
            $0.bottom.equalTo(buttonsView.snp.bottom).inset(40)
            $0.leading.equalTo(buttonsView.snp.leading).inset(20)
            $0.trailing.equalTo(buttonsView.snp.trailing).inset(20)
        }
        
        // 하단 버튼 View Layout
        buttonsView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(130)
            $0.width.equalToSuperview()
        }
    }
    
    //MARK: - tableView 세팅
    
    // tableView 세팅
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartItemButtonCell.self, forCellReuseIdentifier: "CartItemButtonCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemButtonCell", for: indexPath) as? CartItemButtonCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none // 셀 선택 색상 제거
        return cell
    }
}

