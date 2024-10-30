import UIKit


class Calculator { //메인 계산기
    
    var intialNum1: Int = 0
    var intialNum2: Int = 0
    
    init(inputNumber1: Int, inputNumber2: Int) {
        self.intialNum1 = inputNumber1
        self.intialNum2 = inputNumber2
    }
    
    //계산기 내부에는 사칙연산 기능이 있고
    //기능 내부에는 실제 로직이 들어가 있음
    
    func add() {
        AddOperation.NumberForBasicOperation(num1: intialNum1, num2: intialNum2)
    }
    
    func sub() {
        SubstractOperation.NumberForBasicOperation(num1: intialNum1, num2: intialNum2)
    }
    
    func mul() {
        MultiplyOperation.NumberForBasicOperation(num1: intialNum1, num2: intialNum2)
    }
    
    func div() {
        DivideOperation.NumberForBasicOperation(num1: intialNum1, num2: intialNum2)
    }
    
    
}

//더하기
class AddOperation: AbstractOperation {
    
    static func NumberForBasicOperation(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}


//빼기
class SubstractOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
}

//곱하기
class MultiplyOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}


//나누기
class DivideOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int) -> Int {
        return num1 / num2
    }
}



let realCalculator = Calculator(inputNumber1: 10, inputNumber2: 3)
realCalculator.add() //계산기의 더하기 기능에 접근




protocol AbstractOperation {
    //프로토콜
    //기존의 클래스들과 관계를 맺어야한다. 해당 프로토콜을 채택해야된다.
    //프로토콜은 내부에 요구사항을 정의 해줘야한다.
    
    static func NumberForBasicOperation(num1 : Int, num2: Int) -> Int
    //사칙연산을 위한 숫자를 받는 요구사항.
    
    
}


//실패원인 - 클래스 상속 개념 미흡, 부모, 자식클래스의 개념에 대해 다시 공부할것
//?? 부모클래스에서 자식클래스를 실행할수가있나?
//저장속성의 경우 어차피 부모클래스에서 넘어오는것이라서 바로 초기화 된걸 바로 사용해도 됨
//상속은 상위클래스의 메모리 구조를 따라간다.
//만약 프로토콜이라는 개념을 사용한다면? -> 이건 조건에 맞지 않음
//계산기 내부에는 사칙연산 기능이 들어간다.
//아 너무 어렵게 생각했었음...
//관계를 맺는다는게 메인 클래스내에 다른 클래스가 들어가도 관계를 맺는거나 마찬가지..


