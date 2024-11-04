////
////  LV.2.swift
////  BaseBall
////
////  Created by 진욱의 Macintosh on 11/4/24.
////
//
//import Foundation
//
//class BaseBallGame {
//    
//    var inputString: String?
//    
//    var inputNum = 0
//    var randomNumber = 0
//    
//    init(input: String?){
//        self.inputString = input
//    }
//    
//    func start() {
//        randomNumber = getRadomNumber()
//        checkUserInput(inputString: inputString)
//    }
//    
//    //랜덤값 추출로직
//    func getRadomNumber() -> Int {
//        let ran1 = Int.random(in: 111...999)
//        var ran2 = 0
//        
//        repeat {
//            //랜덤값의 나머지가 0이 아니라면 == 세자리수중 0이 없는 숫자들이면
//            if (ran1%10 != 0) && ((ran1/10)%10 != 0) {
//                ran2 = ran1
//                //조건문이 true라면 반복문을 벗어남.
//                break
//            }
//            //ran2 값이 0보다 큰경우만 반복.
//        }while(ran2>0)
//        
//        return ran2
//    }
//    
//    
//    //옵셔널 바인딩과 동일값 여부 로직
//    func checkUserInput(inputString: String?) {
//        
//        if let inString = inputString {
//            if let numString = Int(inString){
//                inputNum = numString
//                print("랜덤숫자 : \(randomNumber)")
//                print("입력한 수는 \(inputNum)")
//            } else {
//                print("정수를 입력하세요")
//            }
//        }
//        
//        if randomNumber == inputNum {
//            print("숫자가 동일하다.")
//        } else {
//            print("동일하지 않다.")
//        }
//    }
//    
//}
//
//
//let Stringinput = readLine()
//func start() {
//    let game = BaseBallGame(input: Stringinput)
//    game.start()
//}
//
