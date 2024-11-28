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
        imageView.image = UIImage(systemName: "trash")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = ThemeColors.black
        //imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    // 상품이름 Label
    private let cartItemLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol name"
        label.text = "wifi"
        label.font = ThemeFonts.h2
        label.textColor = ThemeColors.black
        label.textAlignment = .right
        label.textAlignment = .center
        return label
    }()
    
    
    //  상품 단가 가격 Label
    private let cartItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "10,000 원"
        label.font = ThemeFonts.h2
        label.textColor = ThemeColors.blue
        label.textAlignment = .right
        return label
    }()
    
    // 전체 삭제 Button
    private let totalDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 이 항목 삭제", for: .normal)
        button.setTitleColor(ThemeColors.grey1, for: .normal)
        button.titleLabel?.font = ThemeFonts.p
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = ThemeColors.grey1
        button.titleLabel?.textAlignment = .right
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    //  상품 갯수 Label
    lazy var cartItemQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "주문수량 : \(Int(itemQuantity)) 개"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.black
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
        stepper.backgroundColor = .orange
        return stepper
    }()
    
    //  상품 합계 가격 Label
    lazy var cartItemTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "= 20,000 원"
        label.font = ThemeFonts.h3bold
        label.textColor = ThemeColors.black
        label.textAlignment = .center
        return label
    }()
    
    // 이름, 단가 삭제버튼 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .trailing
        //stackView.backgroundColor = .red
        return stackView
    }()
    
    // image와 오른쪽 View
    private let itemHorizonView: UIView = {
        let view = UIView()
        //view.backgroundColor = .green
        return view
    }()
    
    // 갯수와 stepper 합계금액 horizontalView
    private let calculateHorizontalView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.backgroundColor = ThemeColors.grey6
        return stackView
    }()
    
    // cellView
    private let cellView: UIView = {
        let view = UIView()
        //view.backgroundColor = .cyan
        return view
    }()
    
    //dequeue시 데이터 입력
    func configure(_ cartItem: CartItem) {
        self.cartItem = cartItem
    }
    
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
            $0.top.equalTo(contentView.snp.top)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        itemHorizonView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(calculateHorizontalView.snp.top)
        }
        
        // 아이템 이미지 Layout
        cartItemImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(100)
        }
        
        // 오른쪽 이름, 단가 삭제버튼 verticalStackView
        itemVerticalstackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalTo(calculateHorizontalView.snp.top)
            $0.width.equalTo(150)
        }
        
        // 아래 수량과 스태퍼 합계 horizontalView
        calculateHorizontalView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        // 아이템 이름 Layout
        cartItemLabel.snp.makeConstraints {
            $0.height.equalTo(ThemeNumbers.padding)
            $0.width.equalTo(itemVerticalstackView.snp.width)
            $0.trailing.equalTo(itemVerticalstackView.snp.trailing)
        }
        
        // 아이템 단가 Layout
        cartItemPriceLabel.snp.makeConstraints {
            $0.height.equalTo(ThemeNumbers.padding)
            $0.trailing.equalTo(itemVerticalstackView.snp.trailing)
        }
        
        // 전체 삭제 버튼 Layout
        totalDeleteButton.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        // 아이템 선택된 갯수 Layout
        cartItemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(140)
        }
        // stepper Layout
        stepper.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(cartItemQuantityLabel.snp.trailing).offset(10)
            $0.width.equalTo(94)
            $0.height.equalTo(30)
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
    }
    
    // stepper 버튼 액션
    private func stepperAction() {
        self.stepper.addTarget(self, action: #selector(pressedStepper), for: .valueChanged)
    }
    
    @objc func pressedStepper(_ sender: UIStepper) {
        let newValue = sender.value
        
        itemQuantity = newValue
        self.cartItemQuantityLabel.text = "주문수량 : \(Int(itemQuantity)) 개"
    }
}



//#Preview {
//    JeffTestViewController()
//}
