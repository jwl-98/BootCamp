//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//
//
import UIKit
import SnapKit

class CartView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //MARK: - 컴포넌트 생성
    
    // Background View
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        return view
    }()
   
    // 상단 장바구니 요약 View
    private let summaryView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()
    
    // 상단바 내부 닫기 Button
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기 X", for: .normal)
        button.titleLabel?.font = ThemeFonts.p
        button.setTitleColor(ThemeColors.white, for: .normal)
        return button
    }()
    
    // 상단바 내부 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .left
        return label
    }()
    
    // 상단바 내부 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .right
        return label
    }()
    
    // 장바구니 목록을 보여주는 TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: - setting
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - 레이아웃
    
    private func setupView() {
        addSubview(backgroundView)
        summaryView.addSubview(closeButton)
        summaryView.addSubview(countTotalItemLabel)
        summaryView.addSubview(totalItemPriceLabel)
        backgroundView.addSubview(summaryView)
        backgroundView.addSubview(tableView)
        
        // background Layout
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        // 상단바 Layout
        summaryView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        // 상단바 닫기버튼 Layout
        closeButton.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.top)
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.width.height.equalTo(50)
        }
        
        // 상단바 장바구니 갯수 Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(summaryView.snp.leading).inset(ThemeNumbers.paddingSmall)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // 상단바 합계금액 Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // 테이블뷰 Layout
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(summaryView.snp.bottom)
            $0.bottom.equalToSuperview().inset(200)
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
