//
//  MenuItem.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit

import SnapKit

class MenuItemButtonCell : UICollectionViewCell {

    // MARK: - 컴포넌트 생성

    // 셀의 아이템 요소를 저장할 stackView
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center

        return stackView
    }()

    // 아이템 이미지 ImageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black

        return imageView
    }()


    // 셀 하단  View - 이름, 가격, 버튼
    let bottomView: UIView = {
        let view = UIView()

        return view
    }()

    // 아이템 정보 View - 이름, 가격
    let itemInformationView: UIView = {
        let view = UIView()

        return view
    }()

    // 상세보기 Button
    let detailsButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        let buttonImage = UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration:  config)
        button.setImage(buttonImage, for: .normal)

        return button
    }()

    // 아이템 이름 Label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.black

        return label
    }()

    // 아이템 가격 Label
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeFonts.small
        label.textColor = ThemeColors.blue

        return label
    }()


    // MARK: - UI 설정

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.contentView.addSubview(stackView)

        [imageView, bottomView].forEach {
            stackView.addArrangedSubview($0)
        }

        [itemInformationView, detailsButton].forEach {
            bottomView.addSubview($0)
        }

        [nameLabel, priceLabel].forEach {
            itemInformationView.addSubview($0)
        }

        self.backgroundColor = ThemeColors.white
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 30
        self.clipsToBounds = true

        stackView.snp.makeConstraints {
            $0.width.height.leading.trailing.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.height.equalTo(70)
        }

        bottomView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.bottom.width.equalToSuperview()
        }

        itemInformationView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(120)
        }

        detailsButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(50)
        }

        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(20)
        }

        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }

    // MARK: - 셀 별로 세부 설정

    func configure(_ menuItem: MenuItem) {
        nameLabel.text = menuItem.name
        priceLabel.text = "\(menuItem.price)원"
        imageView.image = UIImage(systemName: menuItem.symbolId)


    }
}
