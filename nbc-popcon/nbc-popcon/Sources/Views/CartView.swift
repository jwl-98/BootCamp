//
//  CartView.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//
//
import UIKit
import SnapKit

class CartView: UIView {
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    //  장바구니 요약 View (장바구니 갯수 + 합계금액)
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()
    
    // 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.h3
        label.textAlignment = .left
        return label
    }()
    
    // 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.h3bold
        label.textAlignment = .right
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViewLayout() {
        
        addSubview(footerView)
        footerView.addSubview(countTotalItemLabel)
        footerView.addSubview(totalItemPriceLabel)
        
        footerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        //  장바구니 갯수 Label Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(footerView.snp.leading).inset(ThemeNumbers.padding)
            $0.bottom.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(5)
            $0.height.equalTo(60)
        }
        
        //  합계 금액 Label Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(footerView.snp.trailing).inset(ThemeNumbers.padding)
            $0.bottom.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(5)
            $0.height.equalTo(60)
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedfooterView))
        footerView.isUserInteractionEnabled = true
        countTotalItemLabel.isUserInteractionEnabled = true
        totalItemPriceLabel.isUserInteractionEnabled = true
        footerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tappedfooterView() {
        guard let topVC = AppHelpers.getTopViewController() else {
            return
        }
        
        let modalVC = CartModalViewController()
        modalVC.modalPresentationStyle = .overFullScreen
        
        if #available(iOS 13.0, *) {
            modalVC.isModalInPresentation = true
        }
        
        topVC.present(modalVC, animated: true, completion: nil)
    }
    
    
}
