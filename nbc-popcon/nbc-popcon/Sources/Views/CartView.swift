//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//
//
import UIKit
import SnapKit

class CartView: UIView {
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //  장바구니 요약 View (장바구니 갯수 + 합계금액)
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()
    
    // 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.h3
        label.textAlignment = .left
        return label
    }()
    
    // 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.h3bold
        label.textAlignment = .right
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViewLayout() {
        
        addSubview(footerView)
        footerView.addSubview(countTotalItemLabel)
        footerView.addSubview(totalItemPriceLabel)
        
        footerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
        }
        //  장바구니 갯수 Label Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(footerView.snp.leading).inset(ThemeNumbers.paddingSmall)
            $0.top.equalTo(footerView.snp.top).inset(10)
            $0.height.equalTo(50)
        }
        
        //  합계 금액 Label Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(footerView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.top.equalTo(footerView.snp.top).inset(10)
            $0.height.equalTo(50)
        }
    }
}
/*
 class CartView: UIView, UITableViewDelegate, UITableViewDataSource {
    // totalCount -> 각 아이템의 갯수의 합
    // totalPrice -> (각 아이템의 갯수 * 단가) + 합
    
    let orderButtonsView = ButtonsView()
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //MARK: - 컴포넌트 생성
    
    // 상단 닫기버튼 View
    private let closeButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        
//        let border = UIView()
//        border.backgroundColor = ThemeColors.yellow
//        view.addSubview(border)
//        
//        border.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalTo(view.snp.bottom).inset(-50)
//            make.height.equalTo(10)
//        }
        return view
    }()

    // 닫기 Button
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기 X", for: .normal)
        button.titleLabel?.font = ThemeFonts.p
        button.setTitleColor(ThemeColors.white, for: .normal)
        return button
    }()
    
    // colorView (노란색 선)
    private let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.yellow
        return view
    }()
 
    // tableview + summary + button View
    private let insertView: UIView = {
        let view = UIView()
        return view
    }()
  
    // 장바구니 목록을 보여주는 TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //  장바구니 요약 View (장바구니 갯수 + 합계금액)
    private let summaryView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        return view
    }()
    
    // 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .left
        return label
    }()
    
    // 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .right
        return label
    }()
    
    // 하단 buttons View
    private let buttonsView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        // view의 상단에만 테투리를 적용
        let border = UIView()
        border.backgroundColor = ThemeColors.white
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0 , width: view.frame.width, height: 1)
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
      
        closeButtonView.addSubview(closeButton)
        summaryView.addSubview(countTotalItemLabel)
        summaryView.addSubview(totalItemPriceLabel)
        buttonsView.addSubview(orderButtonsView)
        [tableView, summaryView,buttonsView].forEach { insertView.addSubview($0) }
        [closeButtonView, colorView, insertView].forEach { addSubview($0) }
        
        // 닫기 button view Layout
        closeButtonView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        //  닫기 button Layout
        closeButton.snp.makeConstraints {
            $0.top.equalTo(closeButtonView.snp.top)
            $0.trailing.equalTo(closeButtonView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.width.height.equalTo(50)
        }
        
        // colorview Layout
        colorView.snp.makeConstraints {
            $0.top.equalTo(closeButtonView.snp.bottom)
            $0.bottom.equalTo(insertView.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        // insertview Layout
        insertView.snp.makeConstraints {
            $0.top.equalTo(colorView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        // tableView Layout
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalTo(summaryView.snp.top)
            $0.height.equalTo(200)
        }
        
        // summaryView Layout
        summaryView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        // 상단바 닫기버튼 Layout
        closeButton.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.top)
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.padding)
            $0.width.height.equalTo(50)
        }
        
        // 상단바 장바구니 갯수 Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(summaryView.snp.leading).inset(ThemeNumbers.padding)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        //  합계 금액 Label Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.padding)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // orderButtonsView Layout
        orderButtonsView.snp.makeConstraints {
            $0.top.equalTo(buttonsView.snp.top).inset(20)
            $0.leading.equalTo(buttonsView.snp.leading).inset(20)
            $0.trailing.equalTo(buttonsView.snp.trailing).inset(20)
        }
        
        // 하단 button View Layout
        buttonsView.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
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

*/
