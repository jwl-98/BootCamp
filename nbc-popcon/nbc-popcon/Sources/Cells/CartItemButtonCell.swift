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
//        stepper.backgroundColor = .yellow
        stepper.tintColor = .white
        return stepper
    }()
    
    // 전체 삭제 Button
    private let totalDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle(" 이 항목 삭제", for: .normal)
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        
        return button
    }()
    
    // 상품 이미지, 이름, 단가 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemMint
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    // 갯수와 stepper horizontalStackView
    private let countHorizontalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
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
    
    // 전체 horizontalStackView
    private let totalHorizontalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .green
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupTableViewCell() {
       
        itemVerticalstackView.addArrangedSubview(cartItemImageView)
        itemVerticalstackView.addArrangedSubview(cartItemLabel)
        itemVerticalstackView.addArrangedSubview(cartItemPriceLabel)
        countHorizontalstackView.addArrangedSubview(cartItemQuantityLabel)
        countHorizontalstackView.addArrangedSubview(stepper)
        calculateVerticalstackView.addArrangedSubview(countHorizontalstackView)
        calculateVerticalstackView.addArrangedSubview(cartItemTotalPriceLabel)
        calculateVerticalstackView.addArrangedSubview(totalDeleteButton)
        totalHorizontalstackView.addArrangedSubview(itemVerticalstackView)
        totalHorizontalstackView.addArrangedSubview(calculateVerticalstackView)
       
        contentView.addSubview(totalHorizontalstackView)
        
        totalHorizontalstackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        itemVerticalstackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalTo(totalHorizontalstackView.snp.bottom).inset(10)
        
        }
        
        calculateVerticalstackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(160)
            
        }
        
        countHorizontalstackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(50)
        }
        
        cartItemImageView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        stepper.snp.makeConstraints {
            $0.width.equalTo(80)
        }
    }
}

#Preview {
    JeffTestViewController()
}
