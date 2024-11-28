//
//  Category.swift
//  nbc-popcon
//
//  Created by t2023-m0072 on 11/27/24.
//

import Foundation

enum Category: String, CaseIterable {
    
    case communication = "통신"
    case tool = "사물 및 도구"
    case health = "건강"
    case others = "기타"
    
    /// rawValue 기반 초기화
    init(rawValue: String) {
        switch rawValue {
        case "통신":
            self = .communication
        case "사물 및 도구":
            self = .tool
        case "건강":
            self = .health
        default:
            self = .others
        }
    }
    
    /// fallback 값을 포함하는 초기화 (기본값이 필요할 때 사용)
    init(fallbackRawValue: String) {
        self = Category(rawValue: fallbackRawValue) ?? .others
    }
}
