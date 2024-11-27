//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    var totalPrice: Int = 40000 // 총 주문 금액
    var totalCount: Int = 7     // 총 아이템 개수
    
    // MARK: - UI Components
    
    // 상단 장바구니 요약 View
    private let summaryView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink // 기본 라이트 모드 색상
        return view
    }()
    
    // 상단바 내부 닫기 Button
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기 X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // 상단바 내부 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    // 상단바 내부 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    // 장바구니 목록을 보여주는 TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange // 기본 라이트 모드 색상
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureTableView()
        applyTheme() // 초기 테마 적용
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        configureTableView()
        applyTheme() // 초기 테마 적용
    }
    
    // MARK: - Layout 설정
    
    private func setupView() {
        addSubview(summaryView)
        summaryView.addSubview(closeButton)
        summaryView.addSubview(countTotalItemLabel)
        summaryView.addSubview(totalItemPriceLabel)
        addSubview(tableView)
        
        // 상단 요약 뷰 Layout
        summaryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        // 닫기 버튼 Layout
        closeButton.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.top).offset(10)
            $0.trailing.equalTo(summaryView.snp.trailing).inset(10)
            $0.width.height.equalTo(50)
        }
        
        // 장바구니 총 개수 Label Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(summaryView.snp.leading).inset(10)
            $0.bottom.equalTo(summaryView.snp.bottom).inset(10)
            $0.height.equalTo(50)
        }
        
        // 총 금액 Label Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(summaryView.snp.trailing).inset(10)
            $0.bottom.equalTo(summaryView.snp.bottom).inset(10)
            $0.height.equalTo(50)
        }
        
        // 테이블뷰 Layout
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(summaryView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
     
    // MARK: - TableView 설정
    
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
        return cell
    }
}

// MARK: - 테마 변경 메서드 추가

extension CartView {
    /// 테마에 따라 UI를 업데이트합니다.
    func updateTheme(to theme: UIUserInterfaceStyle) {
        switch theme {
        case .light:
            // 라이트 모드: 기본 색상 유지
            self.backgroundColor = .white
            summaryView.backgroundColor = .systemPink
            countTotalItemLabel.textColor = .white
            totalItemPriceLabel.textColor = .white
            tableView.backgroundColor = .orange
        case .dark:
            // 다크 모드: 다크 테마 적용
            self.backgroundColor = .black
            summaryView.backgroundColor = .darkGray
            countTotalItemLabel.textColor = .lightGray
            totalItemPriceLabel.textColor = .lightGray
            tableView.backgroundColor = .black
        default:
            // 시스템 설정에 따라 적용
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            self.backgroundColor = isDarkMode ? .black : .white
            summaryView.backgroundColor = isDarkMode ? .darkGray : .systemPink
            countTotalItemLabel.textColor = isDarkMode ? .lightGray : .white
            totalItemPriceLabel.textColor = isDarkMode ? .lightGray : .white
            tableView.backgroundColor = isDarkMode ? .black : .orange
        }
    }

    /// 현재 테마 상태에 따라 즉시 적용
    private func applyTheme() {
        let currentTheme = traitCollection.userInterfaceStyle
        updateTheme(to: currentTheme)
    }
}
