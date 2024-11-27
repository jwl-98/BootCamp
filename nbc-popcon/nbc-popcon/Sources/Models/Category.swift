//
//  Category.swift
//  nbc-popcon
//
//  Created by t2023-m0072 on 11/27/24.
//

import Foundation

enum Category: Int {
    
  case communication = 0
  case tool = 1
  case health = 2
    
  var kor: String {
    switch self {
    case .communication: return "통신"
    case .tool: return "사물 및 도구"
    case .health: return "건강"
    }
  }
}
