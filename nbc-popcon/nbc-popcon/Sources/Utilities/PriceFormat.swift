//
//  PriceFormat.swift
//  nbc-popcon
//
//  Created by 진욱의 Macintosh on 11/28/24.
//

import Foundation

struct PriceFormat {
    //가격 포멧
    //1000 단위 구분
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
    
    // Int를 원화 형식으로 변환
    static func wonFormat(_ number: Int) -> String {
        let result = formatter.string(from: NSNumber(value: number)) ?? "0"
        return result + "원"
    }
}
