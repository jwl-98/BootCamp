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
    
      var calculatorButton: [UIButton] = {
        var buttonLabel : [String] = ["7","8","9","+"]
        var saveButtonToArray: [UIButton] = []
        
        for i in 1...buttonLabel.count {
            let button = UIButton()
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor =  UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.frame.size.height = 80
            button.frame.size.width = 80
           // button.layer.cornerRadius = 40
            button.setTitle(buttonLabel[i-1], for: .normal)
            
            saveButtonToArray.append(button)
        }
        
        return saveButtonToArray
        
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let hSV = UIStackView(arrangedSubviews: calculatorButton)
        
        hSV.axis = .horizontal
        hSV.backgroundColor = .black
        hSV.spacing = 10
        hSV.distribution = .fillEqually
    
        return hSV
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
    
    func setHorizontalStackViewAutoLayout() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: 80),
            horizontalStackView.widthAnchor.constraint(equalToConstant: 350),
          horizontalStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 60),
            horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)

         ])
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainLabel)
        setMainLabelAutoLayout()
        addSubview(horizontalStackView)
        setHorizontalStackViewAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
