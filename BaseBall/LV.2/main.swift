//
//  main.swift
//  BaseBall(LV.2
//
//  Created by 진욱의 Macintosh on 11/4/24.
//

import Foundation

class BaseBallGame {
    
   // var inputString: String? //입력값을 저장하기위한 변수
    var inputNum = 0 //입력값을 저장하기위한 변수
    
    var randomNumber = 0 //랜덤숫자를 저장하기위한 변수
    
    var userNumberArray:[Int] = [] //세자리 수를 배열에 담기위한 배열
    var randomArray:[Int] = []
    
    

    func start() {
        print(#function)
        randomArray = getRadomNumberArray()
        BaseBallGameLogic()
    }
    
    //랜덤값 추출로직
    func getRadomNumberArray() -> [Int] {
        print(#function)
        randomNumber = Int.random(in: 111...999)
        var ran2 = 0
        repeat {
            // 세자리수중 0이 없는 숫자들 추출하기
            if (randomNumber%10 != 0) && ((randomNumber/10)%10 != 0) {
                ran2 = randomNumber
                while(ran2 > 0) {
                    randomArray += [ran2%10]
                    ran2 /= 10
                }
                //조건문이 true라면 반복문을 벗어남.
                break
            } else { //랜덤숫자중 0이 껴있으면 숫자를 다시생성
                randomNumber = Int.random(in: 111...999)
                continue
            }
            //ran2 값이 0인경우 -> 초기화 되지 않은경우
        }while(ran2 == 0)
        
        print("랜덤숫자 : \(randomNumber)")
        return randomArray.reversed()
    }
    
    //유저의 입력값 검증
    func checkUserInput() -> Bool {
        print("숫자를 입력하세요 : ")
        let Stringinput = readLine()
        
        
        print(#function)
        if let inString = Stringinput { //입력값이 존재한다면.
            if let numString = Int(inString){
                inputNum = numString
                if inputNum < 1000 && ((inputNum%10 != 0) && ((inputNum/10)%10 != 0)) {
                    //세자리 수를 초과하지 않고, 0이 껴있는 세자리 수가 아니라면 true반환
                    print("입력한 수는 \(inputNum)")
                    //입력된 수를 배열로 변경해주기 위한 함수 호출
                    setUserNumberToArray(input: inputNum)
                    return true
                }
            }
        }
        // 조건 이외의 입력값이 입력되면 에러메세지 출력과 false반환
        print("-------------------")
        print("올바르지 않은 입력값입니다")
        print("-------------------")
        
        return false
    }
    
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
    
    

    
    
    func BaseBallGameLogic() {
        //print(#function)
        
        repeat {
           
            //카운트 수가 누적되지 않게 반복문에 들어가면 카운트 초기화
            var countStrike = 0 //스트라이크 수 카운트를 저장하기위한 변수
            var countBall = 0 //볼 수 카운트를 저장하기위한 변수
            
            //유저의 인풋이 조건에 맞다면 true을 반환하고, 게임 시작.
            if checkUserInput() == true {
                //랜덤숫자의 인덱스와 요소를 튜플의 형태로 추출
                for (Index, Element) in randomArray.enumerated() {
                    print(userNumberArray)
                    
                    //유저배열의 인덱스 넘버를 기반으로 요소를 추출
                    //랜덤숫자의 요소와 동일하다면 스트라이크 카운트 1증가
                    if userNumberArray[Index] == Element  {
                        countStrike += 1
                    }else if userNumberArray.contains(Element) {
                        countBall += 1
                    }
                }
                
                if countStrike != 0 || countBall != 0 {
                    print("\(countStrike)스트라이크")
                    print("\(countBall)볼")
                }
                
                if countStrike == 0 && countBall == 0 {
                    print("Nothing")
                }else if countStrike == 3 {
                    print("정답")
                    break
                }
            }
        }while (true)
    }
}

let game = BaseBallGame()
game.start()

