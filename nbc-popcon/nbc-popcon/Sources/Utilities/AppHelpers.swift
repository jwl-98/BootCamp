//
//  AppHelpers.swift
//  nbc-popcon
//
//  Created by MaxBook on 11/27/24.
//

import UIKit

struct AppHelpers {
    // 현재 최상위 뷰컨트롤러를 가져와서 해당 뷰 컨트롤러에 접근할 수 있도록 해줌.
    static func getTopViewController() -> UIViewController? {
        // 현재 활성화된 UIWindowScene을 가져옴
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }
        
        // 루트 ViewController 가져오기
        var topViewController = window.rootViewController
        
        // 최상위 ViewController 탐색
        while let presentedVC = topViewController?.presentedViewController {
            topViewController = presentedVC
        }
        
        return topViewController
    }

    static func showAlert(title: String, message: String) {
        guard let topVC = getTopViewController() else {
            print("❌ ERROR: Could not find top ViewController.")
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        topVC.present(alert, animated: true, completion: nil)
    }
}
