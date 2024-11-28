//
//  MenuItemDetailView.swift
//  nbc-popcon
//
//  Created by mun on 11/28/24.
//

import UIKit

import SnapKit

class MenuItemDetailView: UIView {
    var symbolImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow

        return image
    }()

    var symbolNameLabel: UILabel = {
        let label = UILabel()
        label.text = "testName"
        label.font = ThemeFonts.h1bold
        label.textColor = ThemeColors.black

        return label
    }()
    var symbolCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "testcategory"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.green

        return label
    }()
    var symbolIdLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol id"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.grey2

        return label
    }()
    var symbolDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol description"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.black

        return label
    }()
    var symbolPriceLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeFonts.h1
        label.textColor = ThemeColors.blue

        return label
    }()

    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20

        return stackView
    }()

    var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("창 닫기", for: .normal)
        button.backgroundColor = ThemeColors.grey4
        button.layer.cornerRadius = 20
        button.setTitleColor(ThemeColors.white, for: .normal)

        return button
    }()
    var addButon: UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.backgroundColor = ThemeColors.blue
        button.layer.cornerRadius = 20
        button.setTitleColor(ThemeColors.white, for: .normal)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("nit")

        self.backgroundColor = .white


        [symbolImage, symbolNameLabel, symbolPriceLabel, symbolCategoryLabel, symbolIdLabel, symbolDescriptionLabel, buttonStackView].forEach {
            self.addSubview($0)
        }

        [closeButton, addButon].forEach {
            buttonStackView.addArrangedSubview($0)
        }

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(item: MenuItem) {

        print(item)
        symbolIdLabel.text = "a"

        symbolNameLabel.text = "item.name"
        symbolCategoryLabel.text = "\(item.category) \(item.symbolId)"
        symbolPriceLabel.text = "\(item.price)"
        symbolDescriptionLabel.text = item.description
        print("왜 안돼")
    }

    private func setupUI() {

        symbolImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(40)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }

        symbolNameLabel.snp.makeConstraints {
            $0.top.equalTo(symbolImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        symbolCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(symbolNameLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        symbolIdLabel.snp.makeConstraints {
            $0.top.equalTo(symbolCategoryLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }

        symbolDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(symbolIdLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        symbolPriceLabel.snp.makeConstraints {
            $0.top.equalTo(symbolDescriptionLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
}
#Preview("DetailModalViewController") {
    DetailModalViewController()
}
