import UIKit

//레벨1

class Calculator {
    
    func basicOperations(a: Int , b: Int) {
        
        print("사칙연산결과")
        
        print("더하기 \(a+b)")
        print("빼기 \(a-b)")
        print("곱하기 \(a*b)")
        print("나누기 \(a/b)")
        //lv2구현 나머지 연산 추가
        print("나머지 \(a%b)")
        //만약 0과 0의 나머지연산 결과는?
    }
    
}

let calculator = Calculator()
calculator.basicOperations(a: 2, b: 5)
//예외처리?? 만약 문자열이 들어간다면??!
