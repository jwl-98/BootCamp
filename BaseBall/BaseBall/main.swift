//
//  main.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/4/24.
//

import Foundation

//LV 1
//1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
//정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

let inputString = readLine()
var inputNum = 0


//랜덤값 추출로직
let randomNum = {
    let ran1 = Int.random(in: 111...999)
    var ran2 = 0
    
    repeat {
        //랜덤값의 나머지가 0이 아니라면 == 세자리수중 0이 없는 숫자들이면
        if (ran1%10 != 0) && ((ran1/10)%10 != 0) {
            ran2 = ran1
            //조건문이 true라면 반복문을 벗어남.
            break
        }
        //ran2 값이 0보다 큰경우만 반복.
    }while(ran2>0)

    return ran2
}()


//옵셔널 바인딩과 동일값 여부 로직
if let inputStringCheck = inputString {
    if let numString = Int(inputStringCheck){
        inputNum = numString
        print("랜덤숫자 : \(randomNum)")
        print("입력한 수는 \(inputNum)")
        
    }else{ //정수가 아닌 다른수가 입력된 경우.
        print("정수를입력하세요.")
    }
    
    if randomNum == inputNum {
        print("숫자가 동일하다.")
    } else {
        print("동일하지 않다.")
    }
    
    
}








