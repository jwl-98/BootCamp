//
//  JeffTestViewController.swift
//  nbc-popcon
//
//  Created by jae hoon lee on 11/26/24.
//
import UIKit
import SnapKit

class JeffTestViewController: UIViewController {
    // totalCount -> 각 아이템의 갯수의 합
    // totalPrice -> (각 아이템의 갯수 * 단가) + 합
    
    private let cartView: UIView = CartView()
    
    private var bottomSheetHeight: CGFloat = 80
    
    var totalPrice: Int = 40000
    var totalCount: Int = 7
    
    // backgroundView
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        return view
    }()
    
    // bottomSheet View
    private let bottomSheetView: UIView = {
        let view = UIView()
        return view
    }()
    
    // 상단바 내부 닫기 Button
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기 X", for: .normal)
        button.titleLabel?.font = ThemeFonts.p
        button.setTitleColor(ThemeColors.white, for: .normal)
        return button
    }()
    
    // 상단바 내부 장바구니 갯수 Label
    lazy var countTotalItemLabel: UILabel = {
        let label = UILabel()
        label.text = "장바구니 : \(totalCount) 개"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .left
        return label
    }()
    
    // 상단바 내부 합계금액 Label
    lazy var totalItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "합계금액 : \(totalPrice) 원"
        label.textColor = ThemeColors.white
        label.font = ThemeFonts.bold
        label.textAlignment = .right
        return label
    }()
    
    // 상단 장바구니 요약 View
    private let summaryView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColors.red
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 부분만 cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewLayout()
       
    }
    
    private func setupViewLayout() {
        view.addSubview(backgroundView)
        view.addSubview(bottomSheetView)
        [closeButton,countTotalItemLabel,totalItemPriceLabel].forEach { summaryView.addSubview($0) }
        [summaryView,cartView].forEach { bottomSheetView.addSubview($0) }
        
        // backgroundView Layout
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        // bottomSheetView Layout
        bottomSheetView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(200)
            $0.height.equalTo(80)
            
        }
        
        // 상단바 Layout
        summaryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        // 상단바 닫기버튼 Layout
        closeButton.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.top)
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.width.height.equalTo(50)
        }
        
        // 상단바 장바구니 갯수 Layout
        countTotalItemLabel.snp.makeConstraints {
            $0.leading.equalTo(summaryView.snp.leading).inset(ThemeNumbers.paddingSmall)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // 상단바 합계금액 Layout
        totalItemPriceLabel.snp.makeConstraints {
            $0.trailing.equalTo(summaryView.snp.trailing).inset(ThemeNumbers.paddingSmall)
            $0.bottom.equalTo(summaryView.snp.bottom)
            $0.height.equalTo(50)
        }
        
        // insertView Layout
        cartView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(summaryView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
    
    func showBottomSheet() {
        UIView.animate(withDuration: 0.3, animations: {
                   self.backgroundView.alpha = 1.0
                   self.bottomSheetView.snp.updateConstraints {
                       $0.bottom.equalToSuperview()
                   }
                   self.view.layoutIfNeeded()
               })
    }
    
    func hideBottomSheet() {
        UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundView.alpha = 0.0
                    self.bottomSheetView.snp.updateConstraints {
                        $0.bottom.equalToSuperview().offset(self.bottomSheetHeight)
                    }
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.dismiss(animated: false)
                })
    }
    
    func setupDismissAction() {
        closeButton.addTarget(self, action: #selector(hideBottomSheetAction), for: .touchUpInside)
        
    }
    
    func updateBottomSheetLayout() {
        bottomSheetView.snp.remakeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(self.view.frame.height - self.bottomSheetHeight)
        }
    }
    
    @objc func hideBottomSheetAction() {
        hideBottomSheet()
    }
}

 
#Preview {
    JeffTestViewController()
}
