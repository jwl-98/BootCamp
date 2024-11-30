//
//  UserInterface.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/6/24.
//


/*유저가 보게될 화면 즉, print문은 해당 구조체에 있습니다.
 게임시작시 해당 구조체의 인스턴스가 생성되면 상황에 맞는 문장을 출력하게 됩니다.*/

import Foundation
struct UserInterface {
    
    //메뉴출력 함수
     func printMenu() {
        print("환영합니다! 원하시는 번호를 입력해주세요!")
        print("1. 게임시작하기 2. 게임기록보기 3. 종료하기")
    }
    
    //메뉴넘버 출력함수
     func printMenuNumber(menuNumberInput: String?) {
        
        switch menuNumberInput {
        case "1" :
            print( "<게임을 시작합니다.>" )
        case "2" :
            print("게임기록")
        case "3" :
            print("종료")
        default :
            print("올바른 숫자를 입력해주세요!")
        }
        
    }
    
    
     func printStartText() {
        print("숫자를 입력하세요 : ")
    }
    
    func printCorrect() {
        print("정답!")
    }
    
    func printErrorUserIn() {
        print("-------------------")
        print("올바르지 않은 입력값입니다")
        print("-------------------")
    }
        
    
}
