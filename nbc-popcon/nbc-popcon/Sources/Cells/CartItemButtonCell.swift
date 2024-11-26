//
//  CartItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit
import SnapKit

class CartItemButtonCell: UITableViewCell {
    
    private let tableViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    // 전체 삭제 Button
    private let totalDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("이 항목 삭제", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    // 상품 imageView
    private let cartItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil.fill")
        imageView.backgroundColor = .brown
        return imageView
    }()
    
    // 상품 이름Label
    private let cartItemLabel: UILabel = {
        let label = UILabel()
        label.text = "연필"
        label.font = .boldSystemFont(ofSize: 16)
        label.backgroundColor = .gray
        return label
    }()
    
    //  상품 단가 가격Label
    private let cartItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "1000원"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    //  상품 갯수Label
    lazy var cartItemQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    //  상품 합계 가격Label
    lazy var cartItemTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "40000"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    // stapper
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 0
        stepper.stepValue = 1
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.backgroundColor = .yellow
        stepper.tintColor = .white
        return stepper
    }()
    
    // 상품 이미지, 이름, 단가 verticalStackView
    private let itemVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .cyan
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    // 갯수와 stepper horizontalStackView
    private let countHorizontalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .cyan
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    // 갯수와 stepper horizontalStackView
    private let totalHorizontalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    // 카운트, 합계금액, 삭제버튼 verticalStackView
    private let calculateVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical
        stackView.spacing = 10
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
        
    }
    
}

#Preview {
    JeffTestViewController()
}
