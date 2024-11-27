//
//  MenuView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit

import SnapKit

class MenuView: UIView {

    // MARK: - 컴포넌트 생성

    // 카테고리에 맞는 아이템을 보여주는 CollectionView
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let rowCount: CGFloat = 2
        let itemSize = (UIScreen.main.bounds.width - (2 * ThemeNumbers.paddingSmall + (rowCount - 1) * ThemeNumbers.itemSpacing)) / rowCount
        layout.itemSize.width = itemSize
        layout.itemSize.height = itemSize
        layout.minimumInteritemSpacing = ThemeNumbers.itemSpacing

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuItemButtonCell.self, forCellWithReuseIdentifier: "MenuItemButtonCell")
        collectionView.backgroundColor = .red

        return collectionView
    }()

    // MARK: - MenuView 기본 설정

    override init(frame: CGRect) {
        super.init(frame: frame)

        [collectionView].forEach {
            self.addSubview($0)
        }

        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - CollectionView 기본 설정

    func configureCollectionView() {
        collectionView.dataSource = self

        collectionView.snp.makeConstraints {
            $0.width.height.top.bottom.equalToSuperview()
        }
    }
}

// MARK: - CollectionView 셀 설정

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource {
    // 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // 테스트용 갯수
    }

    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionview")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemButtonCell", for: indexPath) as? MenuItemButtonCell else { return UICollectionViewCell() }
        cell.configure()

        return cell
    }
}
