//
//  ThemeMode.swift
//  nbc-popcon
//
//  Created by t2023-m0072 on 11/28/24.
//

import Foundation
import UIKit

enum ThemeMode: String, CaseIterable {
    case auto = "자동"
    case light = "라이트 모드"
    case dark = "다크 모드"
    
    static var onThemeChoice: ((ThemeMode) -> Void)?
    
    static var observer: [UIView] = []
    
    static func addObserver(_ view: UIView) {
        Self.observer.append(view)
    }
}
