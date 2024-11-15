//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by 진욱의 Macintosh on 11/15/24.
//

import UIKit

class CalculatorView: UIView {
    
    var mainLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        return label
    }()
    
    
    func setMainLabelAutoLayout() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            mainLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainLabel)
        setMainLabelAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
