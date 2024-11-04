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
let inputnum: Int?


//랜덤값 추출로직
let randomNum = {
    let ran1 = Int.random(in: 111...999)
    var ran2 = 0
    
    repeat {
        if ran1%10 != 0 {
            ran2 = ran1
            break
        }
    }while(ran2>0)

    return ran2
}()


//옵셔널 바인딩과 동일값 여부 로직
if let inputnum = inputString {
    print("랜덤숫자 : \(randomNum)")
    print("입력한 수는 \(inputnum)")
    
    if Int(inputnum) == randomNum {
        print("숫자가 일치한다.")
    }else{
        print("숫자가일치하지 않는다.")
    }
}else{
    print("정수를입력하세요.")
}








