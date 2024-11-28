//
//  CartModalViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/28/24.
//

import UIKit
import SnapKit

//기존 cartView
class CartModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // totalCount -> 각 아이템의 갯수의 합
    // totalPrice -> (각 아이템의 갯수 * 단가) + 합
    let kiosk = Kiosk()
    let orderButtonsView = ButtonsView()
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //MARK: - 컴포넌트 생성
    
    // 상단 닫기버튼 View
    private let closeButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.green
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()

    // 닫기 Button
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("장바구니 닫기", for: .normal)
        button.titleLabel?.font = ThemeFonts.p
        button.setTitleColor(ThemeColors.white, for: .normal)
        return button
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupViewLayout()
        configureTableView()
        addMethod()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewLayout()
        configureTableView()
        addMethod()
    }
    
    //MARK: - 레이아웃
    
    private func setupViewLayout() {
      
        closeButtonView.addSubview(closeButton)
        summaryView.addSubview(countTotalItemLabel)
        summaryView.addSubview(totalItemPriceLabel)
        buttonsView.addSubview(orderButtonsView)
        [tableView, summaryView,buttonsView].forEach { insertView.addSubview($0) }
        [closeButtonView, insertView].forEach { view.addSubview($0) }
        
        // 닫기 button view Layout
        closeButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(62)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        //  닫기 button Layout
        closeButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // insertview Layout
        insertView.snp.makeConstraints {
            $0.top.equalTo(closeButtonView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        // tableView Layout
        tableView.snp.makeConstraints {
            $0.leading.equalTo(insertView.snp.leading)
            $0.trailing.equalTo(insertView.snp.trailing)
            $0.top.equalToSuperview()
            $0.bottom.equalTo(summaryView.snp.top)
        }
        
        // summaryView Layout
        summaryView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        // 상단바 장바구니 갯수 Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(summaryView.snp.leading).inset(ThemeNumbers.padding)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        //  합계 금액 Label Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.padding)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        // orderButtonsView Layout
        orderButtonsView.snp.makeConstraints {
            $0.top.equalTo(buttonsView.snp.top)
            $0.leading.equalTo(buttonsView.snp.leading).inset(20)
            $0.trailing.equalTo(buttonsView.snp.trailing).inset(20)
            $0.bottom.equalTo(buttonsView.snp.bottom).inset(20)
        }
        
        // 하단 button View Layout
        buttonsView.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.bottom)
            $0.bottom.equalTo(insertView.snp.bottom)
            $0.height.equalTo(132)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func addMethod() {
        closeButton.addTarget(self, action: #selector(tabCloseBtn), for: .touchUpInside)
        
    }
    
    private func closeModal() {
        self.dismiss(animated: true)
    }
    
    @objc func tabCloseBtn() {
        closeModal()
    }
    
    //MARK: - tableView 세팅
    
    // tableView 세팅
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartItemButtonCell.self, forCellReuseIdentifier: "CartItemButtonCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let cartItems = kiosk.getCartItems()
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemButtonCell", for: indexPath) as? CartItemButtonCell else { return UITableViewCell() }
        
        //let cartItems = kiosk.getCartItems() // Kiosk에서 cartItems 가져오기
        //let item = cartItems[indexPath.row]  // 현재 행의 아이템 가져오기
        //cell.configure(with: item)          // 데이터 전달
        
        cell.selectionStyle = .none // 셀 선택 색상 제거
        return cell
    }
    
}
