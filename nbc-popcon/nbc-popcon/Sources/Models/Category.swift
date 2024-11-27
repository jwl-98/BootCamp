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
//    
//    var kor: String {
//        switch self {
//        case .communication: return "통신"
//        case .tool: return "사물 및 도구"
//        case .health: return "건강"
//        }
//    }
    
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
}
