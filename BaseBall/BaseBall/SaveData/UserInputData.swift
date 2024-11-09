//
//  UserInputData.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation


/*
 유저 인풋 데이터
  게임을 시작하고 사용자가 세자리수를 입력했을때 세자리수를 검증하는 클래스입니다.
 */


class UserInputData {
    
    let ui = UserInterface()
    let data : Data
    
    
    var inputNum = 0
    var userNumberArray:[Int] = [] //세자리 수를 배열에 담기위한 배열
    
    init(copyeData: Data) {
        self.data = copyeData
    }
    
  /*  checkUserInput()
    해당 함수의 실행 시점은
    baseBallGameLogic()내 if문 입니다.
    실행하여 리턴 되는 Bool값에 따라 게임 로직이 실행되거나 실행되지 않습니다.
   */
    
    func checkUserInput() -> Bool {
        print(#function)
        ui.printStartText()
        let Stringinput = readLine()
        
        if let inString = Stringinput { //입력값이 존재한다면.
            if let numString = Int(inString){
                inputNum = numString
                if inputNum < 1000 && inputNum > 100 {
                    //세자리 수를 초과하지 않고, 0이 껴있는 세자리 수가 아니라면 true반환
                    
                    //입력된 수를 배열로 변경해주기 위한 함수 호출
                    setUserNumberToArray(input: inputNum)
                    return true
                }
            }
        }
        
        return false
    }
    
    /*checkUserInput() 내에서 실행되는 함수입니다.
     유저 넘버를 받아서 수를 분리해 내어 배열로 변경후
     배열을 뒤집어 리턴합니다.
     */
    
    func setUserNumberToArray(input: Int) {
        print(#function)

        var n = input //입력된 수를 저장하는 변수
        userNumberArray = [] //다시호출되면 배열 초기화
        while(n > 0) {
            userNumberArray += [n%10]
            n /= 10
        }
        userNumberArray = userNumberArray.reversed()
    }

}
