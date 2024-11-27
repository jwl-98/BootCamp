//
//  MenuView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit

import SnapKit

class MenuView: UIView {
    
    // MARK: - 바인딩 메서드
    var onCategorySelected: ((String) -> Void)? = nil

    
    // MARK: - 컴포넌트 생성
    
    // 카테고리를 보여주는 segmentedControl
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.backgroundColor = ThemeColors.green
        return segmentedControl
    }()

    let items = MenuItem.menuItems // 테스트용 아이템

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

        [segmentedControl, collectionView].forEach {
            self.addSubview($0)
        }
        
        configureSegmentedControl()
        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SegmentedControl 레이아웃 설정
    private func configureSegmentedControl() {

        segmentedControl.snp.makeConstraints { view in
            view.top.equalToSuperview()
            view.leading.trailing.equalToSuperview()
            view.height.equalTo(50)
        }
        
        segmentedControl.addTarget(self, action: #selector(self.segmentedChanged(_:)), for: .valueChanged)
    }

    // MARK: - CollectionView 기본 설정

    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.width.bottom.equalToSuperview()
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

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemButtonCell", for: indexPath) as? MenuItemButtonCell else { return UICollectionViewCell() }
        cell.configure(items[indexPath.row])

        return cell
    }
}


// MARK: - 바인딩 메서드

extension MenuView {
    
    //카테고리 설정 메서드
    func configureCategory(_ category: [String]) {
        category.enumerated().forEach {
            self.segmentedControl.insertSegment(withTitle: $0.element, at: $0.offset, animated: false)
        }
    }
    
}

// MARK: - SegmentedControl 액션 메서드

extension MenuView {
    
    @objc private func segmentedChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        guard let categoryRawValue = sender.titleForSegment(at: index) else {
            return
        }
        onCategorySelected?(categoryRawValue)
    }
}


#Preview {
    ViewController()
}
