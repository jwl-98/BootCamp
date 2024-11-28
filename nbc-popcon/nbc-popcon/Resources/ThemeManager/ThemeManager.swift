//
//  ThemeManager.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/25/24.
//


import UIKit


/// 코드의 보수와 관리의 편의성을 위해 각종 색상과 수치 등을 미리 정의.
/// 사용 방법 : ThemeManager.shared.colors.red
struct ThemeManager {
    static let shared = ThemeManager()

    struct Colors {
        // 기본적용 색상값
        let black: UIColor = UIColor.systemBackground
        let white: UIColor = UIColor.label
        let fill: UIColor = UIColor.systemFill

        let grey1: UIColor = UIColor.systemGray
        let grey2: UIColor = UIColor.systemGray2
        let grey3: UIColor = UIColor.systemGray3
        let grey4: UIColor = UIColor.systemGray4
        let grey5: UIColor = UIColor.systemGray5
        let grey6: UIColor = UIColor.systemGray6

        let red: UIColor = UIColor.systemRed
        let blue: UIColor = UIColor.systemBlue
        let yellow: UIColor = UIColor.systemYellow
        let green: UIColor = UIColor.systemGreen
        let orange: UIColor = UIColor.systemOrange
    
        let clear: UIColor = UIColor.clear
    }

    struct Fonts {
        let title1 = UIFont.systemFont(ofSize: 45, weight: .light)
        let title1Bold = UIFont.systemFont(ofSize: 45, weight: .heavy)
        let title2 = UIFont.systemFont(ofSize: 34, weight: .light)
        let title2Bold = UIFont.systemFont(ofSize: 34, weight: .heavy)
        let h1 = UIFont.systemFont(ofSize: 28, weight: .regular)
        let h1bold = UIFont.systemFont(ofSize: 28, weight: .heavy)
        let h2 = UIFont.systemFont(ofSize: 22, weight: .regular)
        let h2bold = UIFont.systemFont(ofSize: 22, weight: .heavy)
        let h3 = UIFont.systemFont(ofSize: 20, weight: .regular)
        let h3bold = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        let p = UIFont.systemFont(ofSize: 17, weight: .regular)
        let bold = UIFont.systemFont(ofSize: 17, weight: .bold)
        let small = UIFont.systemFont(ofSize: 15, weight: .regular)
        let caption = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    struct Numbers {
        let padding: CGFloat = 20
        let paddingBig: CGFloat = 30
        let paddingSmall: CGFloat = 15
        let radius: CGFloat = 10
        let itemSpacing: CGFloat = 10
    }

    let colors = Colors()
    let fonts = Fonts()
    let numbers = Numbers()
}

