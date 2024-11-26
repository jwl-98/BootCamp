//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartView: UIView {
    private let innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        return tableView
    }()
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "4 개"
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "totalPrice"
        return label
    }()
    
    private let Label: UILabel = {
        let label = UILabel()
        label.text = "총 주문 가격"
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .gray
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        addSubview(innerView)
        innerView.addSubview(countLabel)
        stackView.addArrangedSubview(Label)
        stackView.addArrangedSubview(totalPriceLabel)
        innerView.addSubview(stackView)
        addSubview(tableView)
        
        innerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        countLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(40)
            $0.height.equalTo(50)
        }
       
        Label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(60)
            $0.height.equalTo(50)
        }
        
        totalPriceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(60)
            $0.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints {
            $0.trailing.equalTo(innerView.snp.trailing).inset(30)
            $0.leading.equalTo(countLabel.snp.trailing).offset(80)
            $0.height.equalTo(60)
        }
        
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(innerView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        backgroundColor = .lightGray
    }
}
