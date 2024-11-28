//
//  DetailModalViewController.swift
//  nbc-popcon
//
//  Created by mun on 11/28/24.
//

import UIKit

class DetailModalViewController: UIViewController {

    private let menuItemDetailView = MenuItemDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(menuItemDetailView)

        setupUI()

        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        menuItemDetailView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(200)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
    }

    func configure(menuItem: MenuItem) {
        menuItemDetailView.configure(item: menuItem)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
