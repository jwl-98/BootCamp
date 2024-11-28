//
//  MenuItemDetailView.swift
//  nbc-popcon
//
//  Created by mun on 11/28/24.
//

import UIKit
import SnapKit

class MenuItemDetailView: UIView {

    // MARK: - 컴포넌트 생성

    // 아이콘 이미지 ImageView
    var symbolImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill

        return image
    }()

    // 아이콘 이름 Label
    var symbolNameLabel: UILabel = {
        let label = UILabel()
        label.text = "testName"
        label.font = ThemeFonts.h1bold
        label.textColor = ThemeColors.label

        return label
    }()

    // 아이콘 카테고리 Label
    var symbolCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "testcategory"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.green

        return label
    }()

    // 아이콘 Id Label
    var symbolIdLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol id"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.grey2

        return label
    }()

    // 아이콘 설명 Label
    var symbolDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "symbol description"
        label.font = ThemeFonts.p
        label.textColor = ThemeColors.label
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: CGFloat(5))
        label.textAlignment = .center

        return label
    }()

    // 아이콘 가격 Label
    var symbolPriceLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeFonts.h1
        label.textColor = ThemeColors.blue

        return label
    }()

    // MARK: - UI 설정

    override init(frame: CGRect) {
        super.init(frame: frame)

        [symbolImage, symbolNameLabel, symbolPriceLabel, symbolCategoryLabel, symbolIdLabel, symbolDescriptionLabel].forEach {
            self.addSubview($0)
        }

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 값 설정

    func configure(item: MenuItem) {
        symbolImage.image = UIImage(systemName: item.symbolId)?.withRenderingMode(.alwaysOriginal)
        symbolImage.addSymbolEffect(.variableColor.iterative)
        symbolIdLabel.text = item.symbolId
        symbolNameLabel.text = item.name
        symbolCategoryLabel.text = "\(item.category)"
        symbolPriceLabel.text = PriceFormat.wonFormat(item.price)
        symbolDescriptionLabel.text = item.description
    }

    // MARK: - UI 설정

    private func setupUI() {

        symbolImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(40)
            $0.height.equalTo(100)
        }

        symbolNameLabel.snp.makeConstraints {
            $0.top.equalTo(symbolImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        symbolIdLabel.snp.makeConstraints {
            $0.top.equalTo(symbolNameLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        symbolCategoryLabel.snp.makeConstraints {
            $0.top.equalTo(symbolIdLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        symbolDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(symbolCategoryLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(30)
        }

        symbolPriceLabel.snp.makeConstraints {
            $0.top.equalTo(symbolDescriptionLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
}

