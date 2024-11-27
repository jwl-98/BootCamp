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
        stackView.distribution = .fill
        stackView.alignment = .center

        return stackView
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

    // 아이템 이미지 ImageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    // MARK: - 기본 설정



    func configure(_ menuItem: MenuItem) {
        self.contentView.addSubview(stackView)

        [imageView, nameLabel, priceLabel].forEach {
            stackView.addArrangedSubview($0)
        }

        self.backgroundColor = ThemeColors.white
        self.layer.borderWidth = 7
        self.layer.borderColor = UIColor.systemYellow.cgColor
        self.layer.cornerRadius = ThemeNumbers.radius
        self.clipsToBounds = true

        nameLabel.text = menuItem.name
        priceLabel.text = "\(menuItem.price)"
        imageView.image = UIImage(systemName: menuItem.symbolId)

        stackView.snp.makeConstraints() {
            $0.width.height.leading.trailing.equalToSuperview()
        }

        [nameLabel, priceLabel, imageView].forEach {
            $0.snp.makeConstraints {
                $0.height.equalToSuperview().multipliedBy(Float(1) / Float(3))
            }
        }
    }
}
