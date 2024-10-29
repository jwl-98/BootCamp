import UIKit


class Calculator { //메인 계산기
    
    var mainA: Int = 0
    var mainB: Int = 0
    
    init(a: Int, b: Int) {
        self.mainA = a
        self.mainB = b
    }
    
    var addF = AddOperation()
    var subF = SubstractOperation()
    var mulF = MultiplyOperation()
    var divF = DivideOperation()
    
    
    //계산기 내부에는 사칙연산 기능이 있고
    //기능 내부에는 실제 로직이 들어가 있음
    
    func add() {
        addF.add(a: mainA, b: mainB)
    }
    
    func sub() {
        subF.sub(a: mainA, b: mainB)
    }
    
    func mul() {
        mulF.mul(a: mainA, b: mainB)
    }
    
    func div() {
        
        divF.div(a: mainA, b: mainB)
    }

    
    
}

//레벨3 클래스 만들고, 관계 고래서 메인클래스와 관계 맺기
//메인클래스를 실행해야만 나머지 클래스들이 실행되는

class AddOperation {
    
    
    func add(a: Int, b: Int) {
        
        print(a+b)
    }
        
}


class SubstractOperation { //빼기
    func sub(a: Int, b:Int)  {
        
        print("빼기 \(a+b)")
    }

    
}

class MultiplyOperation  { //곱하기
    func mul(a: Int, b:Int) {
        
        print("곱하기 \(a*b)")
    }
}

class DivideOperation  { //나누기
    
    func div(a: Int, b:Int)  {
        
        print("나누기 \(a/b)")
    }
}



let realCalculator = Calculator(a: 5, b: 4)
realCalculator.add() //계산기의 더하기 기능에 접근


//실패원인 - 클래스 상속 개념 미흡, 부모, 자식클래스의 개념에 대해 다시 공부할것
//?? 부모클래스에서 자식클래스를 실행할수가있나?
//저장속성의 경우 어차피 부모클래스에서 넘어오는것이라서 바로 초기화 된걸 바로 사용해도 됨
//상속은 상위클래스의 메모리 구조를 따라간다.
//만약 프로토콜이라는 개념을 사용한다면? -> 이건 조건에 맞지 않음
//계산기 내부에는 사칙연산 기능이 들어간다.
//아 너무 어렵게 생각했었음...
//관계를 맺는다는게 메인 클래스내에 다른 클래스가 들어가도 관계를 맺는거나 마찬가지..
