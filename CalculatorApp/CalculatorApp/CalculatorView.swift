//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by 진욱의 Macintosh on 11/15/24.


import UIKit

class CalculatorView: UIView {
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var calculatorButton: [UIButton] = {
        
        var saveButtonToArray: [UIButton] = []
        var buttonLabel: [String] = [
            "7","8","9","+",
            "4","5","6","-",
            "1","2","3","*",
            "AC","0","=","/"
        ]
        
        //버튼을 생성하는 로직
        for i in 1...buttonLabel.count {
            var button = UIButton()
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor =  UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.frame.size.height = 80
            button.frame.size.width = 80
            button.layer.cornerRadius = button.frame.width / 2
            button.setTitle(buttonLabel[i-1], for: .normal)
            button = changeButtonColor(button: button)
            
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            saveButtonToArray.append(button)
        }
        
        return saveButtonToArray
        
    }()
    
    func changeButtonColor(button: UIButton) -> UIButton{
        if Int(button.currentTitle!) == nil {
            button.backgroundColor = .orange
            
            return button
        }
        return button
    }
    
   
    var userTypingNumberButton = false
    @objc func buttonTapped(button: UIButton) { //버튼이 눌리면 실행되는 로직
       
        let buttonTitle = button.currentTitle!
        switch buttonTitle {
        case "0"..."9":
            accumulateButton(buttonText: buttonTitle)
            userTypingNumberButton = true
        case "=":
            mainLabel.text! = String(calculate(expression: accumulateButton)!)
        case "AC":
            accumulateButton = resetAll(accumlateButton: &accumulateButton)
            print("버튼값: \(accumulateButton)")
        default: //연산자 기호 처리 case
            print(userTypingNumberButton)
            if userTypingNumberButton {
                operatorButton(operatorButtonText: buttonTitle)
                userTypingNumberButton = false
            }
        }
    }
    
    func operatorButton (operatorButtonText: String) {
        switch operatorButtonText {
        case "+":
            accumulateButton(buttonText: operatorButtonText)
        case "-":
            accumulateButton(buttonText: operatorButtonText)
        case "*":
            accumulateButton(buttonText: operatorButtonText)
        case "/":
            accumulateButton(buttonText: operatorButtonText)
        default:
            break
        }
    }
    var accumulateButton: String = "" //버튼값을 저장하기   위한 변수
    @discardableResult
    func accumulateButton(buttonText: String) -> String { //버튼의 레이블을 누적시겨 저장하는 함수
        accumulateButton += buttonText
        mainLabel.text! = accumulateButton
        
        return accumulateButton
    }
    
    func resetAll(accumlateButton: inout String) -> String { //AC버튼을 누르면 실행되는 함수
        accumlateButton = ""
        mainLabel.text = "0"
        
        return accumlateButton
    }
    
    
    func operationCalculator() {
        
    }
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
    
    
    lazy var horizontalStackView: [UIStackView] = { //가로 스택뷰 생성
        var saveButton: [UIButton] = []
        var fourButtonStackView: [UIStackView] = []
        
        for i in 0..<4 {
            saveButton = Array(calculatorButton[i*4..<(i*4)+4])
            let hSV = UIStackView(arrangedSubviews: saveButton)
            
            
            hSV.axis = .horizontal
            hSV.backgroundColor = .black
            hSV.spacing = 10
            hSV.distribution = .fillEqually
            
            
            fourButtonStackView.append(hSV)
            print("확인")
            print(fourButtonStackView.count)
        }
        
        return fourButtonStackView
    }()
    
    lazy var verticalStackView: UIStackView = { //세로 스택뷰 생성
        let vSV = UIStackView(arrangedSubviews: horizontalStackView)
        
        vSV.axis = .vertical
        vSV.backgroundColor = . black
        vSV.spacing = 10
        vSV.distribution = .fillEqually
        
        
        return vSV
        
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
        
        for hSV in horizontalStackView {
            hSV.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hSV.heightAnchor.constraint(equalToConstant: 80),
                hSV.widthAnchor.constraint(equalToConstant: 350),
                hSV.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
            
        }
    }
    
    func setVerticalStackViewAutoLayout() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 60).isActive = true
        verticalStackView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainLabel)
        setMainLabelAutoLayout()
        addSubview(verticalStackView)
        setVerticalStackViewAutoLayout()
        setHorizontalStackViewAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
