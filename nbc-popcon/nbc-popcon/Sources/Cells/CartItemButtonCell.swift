//
//  CartItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartItemButtonCell: UITableViewCell {
    var itemQuantity = 0.0
    
    // 상품 imageView
    private let cartItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wifi")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    // 상품 이름Label
    private let cartItemLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol name"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.backgroundColor = .lightGray
        return label
    }()
    
    //  상품 단가 가격Label
    private let cartItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "10,000 원"
        label.textColor = .blue
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        return label
    }()
    
    //  상품 갯수Label
    lazy var cartItemQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "X \(Int(itemQuantity))"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        return label
    }()
    
    //  상품 합계 가격Label
    lazy var cartItemTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "총 40,000 원"
        label.textAlignment = .right
        label.backgroundColor = .lightGray
        return label
    }()
    
    // stapper
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = Double(itemQuantity)
        stepper.stepValue = 1.0
        stepper.minimumValue = 0.0
        stepper.maximumValue = 50.0
        stepper.tintColor = .white
        return stepper
    }()
    
    // 전체 삭제 Button
    private let totalDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 이 항목 삭제", for: .normal)
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.titleLabel?.textAlignment = .right
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    // 상품 이미지, 이름, 단가 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemMint
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    // 갯수와 stepper horizontalView
    private let countHorizontalView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // 카운트, 합계금액, 삭제버튼 verticalStackView
    private let calculateVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .gray
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 전체 horizontalView
    private let horizontalView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
 
    //MARK: - setting
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCellLayout()
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
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
            
        // 오른쪽 수량과 스태퍼 horizontalView
        countHorizontalView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview()
        }
        
        // 수량, 가격, 삭제버튼 verticalStackView
        calculateVerticalstackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(150)
        }
         
        // 아이템 이미지 크기
        cartItemImageView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(150)
        }
        
        // 아이템 이름 크기
        cartItemLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        // 아이템 단가 크기
        cartItemPriceLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        // 아이템 선택 갯수 크기
        cartItemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(40)
        }
        
        // stepper 크기
        stepper.snp.makeConstraints {
            $0.trailing.equalTo(countHorizontalView.snp.trailing)
            $0.centerY.equalToSuperview()
        }
    }
}

#Preview {
    JeffTestViewController()
}
