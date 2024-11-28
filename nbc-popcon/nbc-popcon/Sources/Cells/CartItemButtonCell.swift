//
//  CartItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartItemButtonCell: UITableViewCell {
    
    /* cartItemImageView     -> 배열에 담긴 아이템의 이미지 String
     cartItemLabel           -> 배열에 담긴 아이템의 이름 String
     cartItemPriceLabel      -> 배열에 담긴 아이템의 단가 Int
     cartItemQuantityLabel   -> stepper로 변경되는 itemQuantity
     cartItemTotalPriceLabel -> itemQuantity * cartItemPriceLabel
     totalDeleteButton       -> 해당 아이템 배열에서 삭제
     stepper                 -> itemQuantity 값 증감
     */
    
    private let kiosk = Kiosk()
    private var itemQuantity = 1.0
    
    // 상품 imageView
    private let cartItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wifi")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = ThemeColors.black
        return imageView
    }()
    
    // 상품이름 Label
    private let cartItemLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol name"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.black
        label.textAlignment = .center
        return label
    }()
    
    //  상품 단가 가격 Label
    private let cartItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "10,000 원"
        label.font = ThemeFonts.h3
        label.textColor = ThemeColors.blue
        label.textAlignment = .center
        return label
    }()
    
    //  상품 갯수 Label
    lazy var cartItemQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "x \(Int(itemQuantity))"
        label.font = ThemeFonts.h1
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
        return stepper
    }()
    
    //  상품 합계 가격 Label
    lazy var cartItemTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "총 40,000 원"
        label.font = ThemeFonts.h2
        label.textColor = ThemeColors.black
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
    
    // 상품 이미지, 이름, 단가 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    // 갯수와 stepper horizontalView
    private let countHorizontalView: UIView = {
        let view = UIView()
        return view
    }()
    
    // 카운트, 합계금액, 삭제버튼 verticalStackView
    private let calculateVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    // 전체 horizontalView
    private let horizontalView: UIView = {
        let view = UIView()
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
        
        itemVerticalstackView.addArrangedSubview(cartItemImageView)
        itemVerticalstackView.addArrangedSubview(cartItemLabel)
        itemVerticalstackView.addArrangedSubview(cartItemPriceLabel)
        countHorizontalView.addSubview(cartItemQuantityLabel)
        countHorizontalView.addSubview(stepper)
        calculateVerticalstackView.addArrangedSubview(countHorizontalView)
        calculateVerticalstackView.addArrangedSubview(cartItemTotalPriceLabel)
        calculateVerticalstackView.addArrangedSubview(totalDeleteButton)
        horizontalView.addSubview(itemVerticalstackView)
        horizontalView.addSubview(calculateVerticalstackView)

        contentView.addSubview(horizontalView)
      
        // 전체를 감싼 StackView
        horizontalView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        // 왼쪽의 이미지, 이름, 단가 verticalStackView
        itemVerticalstackView.snp.remakeConstraints {
            $0.leading.equalToSuperview().inset(ThemeNumbers.padding)
            $0.top.equalToSuperview().inset(ThemeNumbers.padding)
            $0.bottom.equalToSuperview().inset(ThemeNumbers.padding)
            $0.width.equalTo(130)
        }
            
        // 오른쪽 수량과 스태퍼 horizontalView
        countHorizontalView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview()
        }
        
        // 수량, 가격, 삭제버튼 verticalStackView
        calculateVerticalstackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.trailing.equalToSuperview().inset(ThemeNumbers.padding)
            $0.bottom.equalToSuperview().inset(ThemeNumbers.padding)
            $0.width.equalTo(150)
        }
         
        // 아이템 이미지 Layout
        cartItemImageView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        
        // 아이템 이름 Layout
        cartItemLabel.snp.makeConstraints {
            $0.height.equalTo(ThemeNumbers.padding)
            $0.width.equalTo(itemVerticalstackView.snp.width)
            $0.leading.equalTo(itemVerticalstackView.snp.leading).inset(10)
        }
        
        // 아이템 단가 Layout
        cartItemPriceLabel.snp.makeConstraints {
            $0.height.equalTo(ThemeNumbers.padding + 5)
            $0.leading.equalTo(itemVerticalstackView.snp.leading).inset(10)
        }
        
        // 아이템 선택된 갯수 Layout
        cartItemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(55)
        }
        
        // stepper Layout
        stepper.snp.makeConstraints {
            $0.trailing.equalTo(countHorizontalView.snp.trailing)
            $0.centerY.equalToSuperview()
        }
        
        // 선택된 가격 Layout
        cartItemTotalPriceLabel.snp.makeConstraints {
            $0.height.equalTo(28)
        }
        
        // 전체 삭제 버튼 Layout
        totalDeleteButton.snp.makeConstraints {
            $0.height.equalTo(22)
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
        if newValue > itemQuantity {
            itemQuantity = newValue
            self.cartItemQuantityLabel.text = "x \(Int(self.itemQuantity))"
        } else if newValue < itemQuantity {
            itemQuantity = newValue
            self.cartItemQuantityLabel.text = "x \(Int(self.itemQuantity))"
        }
    }
}



//#Preview {
//    JeffTestViewController()
//}
