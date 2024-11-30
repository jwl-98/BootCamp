//
//  MenuView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//

import UIKit

import SnapKit

/*
 카테고리 열거형 추가
 
 */

class MenuView: UIView {
    
    // MARK: - 바인딩 메서드
    var onCategorySelected: ((String) -> Void)? = nil
    // 메뉴 아이템 선택 액션 - ViewController.setupBindings()를 통해 할당
    var onMenuItemSelected:((MenuItem) -> Void)? = nil

    private var items: [MenuItem] = []
    
    // MARK: - 컴포넌트 생성
    
    // 카테고리를 보여주는 segmentedControl
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()

        segmentedControl.setTitleTextAttributes([.font: ThemeFonts.small], for: .normal)
        
        segmentedControl.backgroundColor = ThemeColors.bg

        return segmentedControl
    }()
    
    private let segmentedControlBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.bg.withAlphaComponent(0.8)
        return view
    }()
    
    // 카테고리에 맞는 아이템을 보여주는 CollectionView
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let rowCount: CGFloat = 2
        let itemSize = (UIScreen.main.bounds.width - (2 * ThemeNumbers.padding + (rowCount - 1) * ThemeNumbers.itemSpacing)) / rowCount
        layout.itemSize.width = itemSize
        layout.itemSize.height = itemSize
        layout.minimumInteritemSpacing = ThemeNumbers.itemSpacing
        layout.minimumLineSpacing = ThemeNumbers.itemSpacing
        layout.headerReferenceSize = CGSize(width: 0, height: 95)
        layout.footerReferenceSize = CGSize(width: 0, height: 80)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuItemButtonCell.self, forCellWithReuseIdentifier: "MenuItemButtonCell")
        collectionView.backgroundColor = ThemeColors.bg
        collectionView.showsVerticalScrollIndicator = false
        
        
        return collectionView
    }()
    
    
    // MARK: - MenuView 기본 설정
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        [collectionView, segmentedControlBackgroundView, segmentedControl].forEach {
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
        
        segmentedControlBackgroundView.snp.makeConstraints { view in
            view.top.equalToSuperview()
            view.height.equalTo(62 + ThemeNumbers.paddingBig)
            view.leading.trailing.equalToSuperview()
        }
        
        segmentedControl.snp.makeConstraints { view in
            view.top.equalToSuperview().inset(ThemeNumbers.paddingBig)
            view.leading.trailing.equalToSuperview()
            view.height.equalTo(32)
        }
        
        segmentedControl.addTarget(self, action: #selector(self.segmentedChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - CollectionView 기본 설정
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints {
            $0.top.width.bottom.equalToSuperview()
        }
    }
}


// MARK: - CollectionView 셀 설정

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemButtonCell", for: indexPath) as? MenuItemButtonCell else { return UICollectionViewCell() }
        cell.configure(items[indexPath.item])

        return cell
    }
    
    // 셀 누르면 실행
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let onCollectionViewCellSelected = self.onMenuItemSelected else { return }
        let menuItem = items[indexPath.item]
        onCollectionViewCellSelected(menuItem)
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            cell?.contentView.alpha = 1.0
        }
    }
    
}

// MARK: - 바인딩 메서드

extension MenuView {
    
    //카테고리 설정 메서드
    func configureCategory(_ category: [String]) {
        category.enumerated().forEach {
            self.segmentedControl.insertSegment(withTitle: $0.element, at: $0.offset, animated: false)
        }
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func menuUpdated(_ items: [MenuItem]) {
        self.items = items
        self.collectionView.reloadData()
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

#Preview("ViewController") {
    ViewController()
}
