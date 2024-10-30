import UIKit


class Calculator { //메인 계산기
    
    //초기 숫자들은 외부에서 건들이지 못하게 private 사용
    private var intialNum1: Int = 0
    private var intialNum2: Int = 0
    
    //사용자에게 숫자를 입력받기 위한 생성자
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
        
        //만약 입력 넘버가 0이거나 작을떄는(음수일때)
        if ((intialNum1 <= 0 ) || (intialNum2 <= 0)) {
            print ("\(intialNum1), \(intialNum2) 으로는 나누기가 불가능합니다.")
            print("힌트: 음수나 0으로는 나눗셈 연산이 불가능 합니다.\n")
            //그렇지 않다면 연산 진행
        }else {
            DivideOperation.NumberForBasicOperation(num1: intialNum1, num2: intialNum2)
        }
    }
    
    
}

//더하기
class AddOperation: AbstractOperation {
    
    static func NumberForBasicOperation(num1: Int, num2: Int)  {
       print("덧셈결과에요 : \(num1 + num2)")
    }
}


//빼기
class SubstractOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int)  {
        print("뺄셈결과에요 : \(num1 - num2)")
    }
}

//곱하기
class MultiplyOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int)  {
        print("곱셈결과에요 : \(num1 * num2)")
    }
}


//나누기
class DivideOperation: AbstractOperation  {
    static func NumberForBasicOperation(num1: Int, num2: Int)  {
        print("나눗셈결과에요 : \(num1 / num2)")
    }
}

//프로토콜
//기존의 클래스들과 관계를 맺어야한다. 해당 프로토콜을 채택해야된다.
//프로토콜은 내부에 요구사항을 정의 해줘야한다.
protocol AbstractOperation {
    
    //사칙연산을 위한 숫자를 받는 요구사항.
    //static 키워드를 사용해서 프로토콜만 채택하면 바로 사용 가능하게 (인스턴스 생성필요없이)
    static func NumberForBasicOperation(num1 : Int, num2: Int)
}

let realCalculator = Calculator(inputNumber1: 10, inputNumber2: 3)
//realCalculator.add() //계산기의 더하기 기능에 접근

//Fatal error: Division by zero
//음수가 입력된경우??
Calculator(inputNumber1: 3, inputNumber2: -2).div()
//에러 발생 -> 0과 0을 나눌수없음.
Calculator(inputNumber1: 0, inputNumber2: 0).div()
Calculator(inputNumber1: 0, inputNumber2: 0).mul()





//실패원인 - 클래스 상속 개념 미흡, 부모, 자식클래스의 개념에 대해 다시 공부할것
//?? 부모클래스에서 자식클래스를 실행할수가있나?
//저장속성의 경우 어차피 부모클래스에서 넘어오는것이라서 바로 초기화 된걸 바로 사용해도 됨
//상속은 상위클래스의 메모리 구조를 따라간다.
//만약 프로토콜이라는 개념을 사용한다면? -> 이건 조건에 맞지 않음
//계산기 내부에는 사칙연산 기능이 들어간다.
//아 너무 어렵게 생각했었음...
//관계를 맺는다는게 메인 클래스내에 다른 클래스가 들어가도 관계를 맺는거나 마찬가지..


