//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartView: UIView {
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //MARK: - 컴포넌트 생성
    
    // 상단 장바구니 계산View
    private let calculateView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    // 상단바 내부 전체 갯수Label
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "\(totalCount)개"
        return label
    }()
    
    // 상단바 내부 문구Label
    private let Label: UILabel = {
        let label = UILabel()
        label.text = "총 주문 가격 : "
        label.font = .boldSystemFont(ofSize: 16)
        label.backgroundColor = .gray
        return label
    }()
    
    // 상단바 내부 합계 가격Label
    lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(totalPrice)"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    // 상단바 내부의 문구와 합계 StackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .cyan
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    // 장바구니 목록을 보여주는 TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        return tableView
    }()
    
    //MARK: - setting
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - 레이아웃
    
    private func setupView() {
        addSubview(calculateView)
        calculateView.addSubview(countLabel)
        stackView.addArrangedSubview(Label)
        stackView.addArrangedSubview(totalPriceLabel)
        calculateView.addSubview(stackView)
        addSubview(tableView)
        
        // 상단바 Layout
        calculateView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(70)
        }
        // 상단바 전체 갯수 Layout
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(40)
            $0.height.equalTo(50)
        }
       
        // 상단바 문구 Layout
        Label.snp.makeConstraints {
            $0.leading.equalTo(stackView.snp.leading).inset(10)
            $0.height.equalToSuperview()
        }
        
        // 상단바 합계 Layout
        totalPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(stackView.snp.trailing).inset(10)
            $0.height.equalToSuperview()
        }
        
        // 상단바 StackView Layout
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(calculateView.snp.trailing).inset(10)
            $0.leading.equalTo(countLabel.snp.trailing).offset(80)
            $0.height.equalTo(50)
        }
        
        // 테이블뷰 Layout
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(calculateView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        // 테스트용 배경색
        backgroundColor = .lightGray
    }
}

