//
//  CartItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartItemButtonCell: UITableViewCell {
    
    private let kiosk = Kiosk()
    private var itemQuantity = 1.0
    
    private var cartItem: CartItem?
    
    var onItemQuantityChanged: ((_ newQuantity: Int) -> Void)?
    var onRemoveCartItem: (() -> Void)?
    
    // 상품 imageView
    private let cartItemImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "trash")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill

        imageView.tintColor = ThemeColors.black
//        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    // 상품이름 Label
    private let cartItemLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상품 이름"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.label
        label.textAlignment = .right
        
        return label
    }()
    
    //  상품 단가 가격 Label
    private let cartItemPriceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "10,000 원"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.blue
        label.textAlignment = .right
        
        return label
    }()
    
    // 전체 삭제 Button
    private let totalDeleteButton: UIButton = {
        let button = UIButton()
        
        button.setTitle(" 이 항목 삭제", for: .normal)
        button.setTitleColor(ThemeColors.grey1, for: .normal)
        button.titleLabel?.font = ThemeFonts.small
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = ThemeColors.grey1
        button.titleLabel?.textAlignment = .right
        button.contentHorizontalAlignment = .right
        
        return button
    }()
    
    //  상품 갯수 Label
    lazy var cartItemQuantityLabel: UILabel = {
        let label = UILabel()
        
        label.text = "주문 : \(Int(itemQuantity)) 개"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.label
        label.textAlignment = .center
        
        return label
    }()
    
    // stapper
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        
        stepper.value = itemQuantity
        stepper.stepValue = 1.0
        stepper.minimumValue = 0.0
        stepper.maximumValue = 50.0

        return stepper
    }()
    
    //  상품 합계 가격 Label
    lazy var cartItemTotalPriceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "= 20,000 원"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.label
        label.textAlignment = .center
        
        return label
    }()
    
    // 이름, 단가 삭제버튼 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .trailing

        return stackView
    }()
    
    // image와 오른쪽 View
    private let itemHorizonView: UIView = {
        
        return UIView()
    }()
    
    // 갯수와 stepper 합계금액 horizontalView
    private let calculateHorizontalView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.backgroundColor = ThemeColors.grey6
        
        return stackView
    }()
    
    // cellView
    private let cellView: UIView = {
        let view = UIView()
        //view.backgroundColor = .cyan
        return view
    }()
    
    
    //MARK: - setting
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCellLayout()
        actionMethod()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - layout
    
    // TableViewCell layout 설정
    private func setupTableViewCellLayout() {
        
        itemHorizonView.addSubview(cartItemImageView)
        itemVerticalstackView.addArrangedSubview(cartItemLabel)
        itemVerticalstackView.addArrangedSubview(cartItemPriceLabel)
        itemVerticalstackView.addArrangedSubview(totalDeleteButton)
        itemHorizonView.addSubview(itemVerticalstackView)
        calculateHorizontalView.addArrangedSubview(cartItemQuantityLabel)
        calculateHorizontalView.addArrangedSubview(stepper)
        calculateHorizontalView.addArrangedSubview(cartItemTotalPriceLabel)
        contentView.addSubview(cellView)
        contentView.addSubview(itemHorizonView)
        contentView.addSubview(calculateHorizontalView)
        
        // 전체를 감싼 cellView
        cellView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            
        }
        
        itemHorizonView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            $0.leading.equalToSuperview().inset(50)
            $0.height.equalTo(130)
        }
        
        // 아이템 이미지 Layout
        cartItemImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(40)
            $0.height.equalTo(60)
        }
        
        // 오른쪽 이름, 단가 삭제버튼 verticalStackView
        itemVerticalstackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(100)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        // 아이템 이름 Layout
        cartItemLabel.snp.makeConstraints {
            $0.height.equalTo(ThemeNumbers.padding)
            $0.width.equalTo(itemVerticalstackView.snp.width)
            $0.trailing.equalTo(itemVerticalstackView.snp.trailing)
        }
        
        // 아이템 단가 Layout
        cartItemPriceLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.trailing.equalTo(itemVerticalstackView.snp.trailing)
        }
        
        // 전체 삭제 버튼 Layout
        totalDeleteButton.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        // 아래 수량과 스태퍼 합계 horizontalView
        calculateHorizontalView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(itemHorizonView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // 아이템 선택된 갯수 Layout
        cartItemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        // stepper Layout
        stepper.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
        }
        
        // 선택된 아이템 가격 Layout
        cartItemTotalPriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(140)
        }
    }
}


extension CartItemButtonCell {
    
    private func actionMethod() {
        stepperAction()
        totalDeleteButtonAction()
    }
    
    // stepper 버튼 액션
    private func stepperAction() {
        self.stepper.addTarget(self, action: #selector(pressedStepper), for: .valueChanged)
    }
    
    @objc private func pressedStepper(_ sender: UIStepper) {
        let newValue = Int(sender.value)
        //키오스크에 수정된 값을 전달
        onItemQuantityChanged?(newValue)
    }
    
    private func totalDeleteButtonAction() {
        self.totalDeleteButton.addTarget(self, action: #selector(pressdTotalDeleteButton), for: .touchUpInside)
    }
    
    @objc private func pressdTotalDeleteButton(_ sender: UIButton) {
        onRemoveCartItem?()
    }
    
    // 테이블뷰 셀의 데이터를 추가
    func configureData(_ cartItem: CartItem) {
        self.cartItem = cartItem
        
        let itemPrice = PriceFormat.wonFormat(cartItem.menuitem.price)
        let totalPriceFormatted = PriceFormat.wonFormat(cartItem.totalPrice)
     
        cartItemLabel.text = cartItem.menuitem.name
        cartItemImageView.image = UIImage(systemName: cartItem.menuitem.symbolId)
        cartItemPriceLabel.text = itemPrice
        cartItemQuantityLabel.text = "주문수량 : \(cartItem.quantity) 개"
        cartItemTotalPriceLabel.text = "= " + totalPriceFormatted
        stepper.value = Double(cartItem.quantity)
    }
}
