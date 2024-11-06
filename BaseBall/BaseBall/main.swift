//
//  main.swift
//  BaseBall(LV.2
//
//  Created by 진욱의 Macintosh on 11/4/24.
//

import Foundation


class BaseBallGame {
    
    static var saveGameCountArr: [Int] = []
    static var saveTryCountNumArr: [Int] = []
    static var tryCountNum = 0 //전역변수의 설정, 시도횟수 넘버는 공통으로 공유를 위함
    static var gameCount = 0 //게임 횟수
    
    var inputNum = 0 //입력값을 저장하기위한 변수
    var randomNumber = 0 //랜덤숫자를 저장하기위한 변수
    
    var userNumberArray:[Int] = [] //세자리 수를 배열에 담기위한 배열
    var randomArray:[Int] = []
    
    
    
    
    var saveMenuNum = 0
    
    func userInterface() {
        
        print("환영합니다! 원하시는 번호를 입력해주세요!")
        print("1. 게임시작하기 2. 게임기록보기 3. 종료하기")
        let menuInputNum = readLine()
            checkMenuNumber(MunuNum: menuInputNum)
    
    }
    
    func checkMenuNumber(MunuNum: String?) {
        
            switch MunuNum {
            case "1" :
                print("<게임을 시작합니다.>")
                readyGame()
            case "2" :
                print("게임기록")
                printRecord()
                userInterface()
            case "3" :
                print("종료")
                
            default :
                print("올바른 숫자를 입력해주세요!")
            }
    }
    
    func printRecord(){
        for i in 0..<BaseBallGame.saveGameCountArr.count {
            print("\(BaseBallGame.saveGameCountArr[i])번째 게임 : 시도횟수 - \(BaseBallGame.saveTryCountNumArr[i])")
        }
    }
    func saveRecord() {
        //시도횟수를 차곡차곡 배열에 담는다.
        BaseBallGame.saveTryCountNumArr += [BaseBallGame.tryCountNum]
        BaseBallGame.saveGameCountArr += [BaseBallGame.gameCount]
    }
    
    
    func endGame() {
        print("종료")
        BaseBallGame.gameCount = 0
        BaseBallGame.tryCountNum = 0
        
    }
    
    func start() {
        //print(#function)
        userInterface()
    }
    
    
    
    func readyGame() {
        BaseBallGame.gameCount += 1
        getRadomNumberArray()
        BaseBallGameLogic()
    }
    
    
    
    func createRadomNumber() -> Int {
        var randomInt = 0
        //        print(#function)
        repeat {
            // 세자리수중 10의자리 0, 1의자리 0이 나오는것들 제외하는 로직
            randomNumber = Int.random(in: 100...999)
            if (randomNumber%100 != 0 && randomNumber > 100) {
                randomInt = randomNumber
                break
            }
            continue
            
        }while(true)
        return randomInt
    }
    
    //랜덤값 추출로직
    func getRadomNumberArray() {
        
        repeat {
            var creatRandom = createRadomNumber()
            randomArray = [] // 랜덤 숫자를 생성한다면, 기존배열 초기화
            
            while(creatRandom > 0) { //랜덤 숫자를 배열에 담는 로직.
                randomArray += [creatRandom%10]
                creatRandom /= 10
            }
            randomArray = randomArray.reversed()
            
            // 세자리수중 겹치는 수가 존재한다면, 로직반복 ex). 133이 나오면 반복
        }while(Set(randomArray).count != 3)
        
        
    }
    
    //유저의 입력값 검증
    func checkUserInput() -> Bool {
        print("숫자를 입력하세요 : ")
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
        // 조건 이외의 입력값이 입력되면 에러메세지 출력과 false반환
        print("-------------------")
        print("올바르지 않은 입력값입니다")
        print("-------------------")
        
        return false
    }
    
    func setUserNumberToArray(input: Int) {
        //        print(#function)
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
        print(randomNumber)
        repeat {
            
            //카운트 수가 누적되지 않게 반복문에 들어가면 카운트 초기화
            var countStrike = 0 //스트라이크 수 카운트를 저장하기위한 변수
            var countBall = 0 //볼 수 카운트를 저장하기위한 변수
            
            //유저의 인풋이 조건에 맞다면 true을 반환하고, 게임 시작.
            if checkUserInput() == true {
                BaseBallGame.tryCountNum += 1
                //랜덤숫자의 인덱스와 요소를 튜플의 형태로 추출
                for (Index, Element) in randomArray.enumerated() {
                    
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
                    print("정답!")
                    saveRecord()
                    //저장하면 시도횟수를 0으로 초기화
                    BaseBallGame.tryCountNum = 0
                    userInterface()
                    break
                }
            }
        }while (true)
    }
    
    
}

let game = BaseBallGame()
game.start()

//
//
//func userInterFace() {
//
//        print("환영합니다! 원하시는 번호를 입력해주세요!")
//        print("1. 게임시작하기 2. 게임기록보기 3. 종료하기")
//        let menuInputNum = readLine()
//
//        switch menuInputNum {
//        case "1" :
//            print("<게임을 시작합니다.>")
//            game.start()
//        case "2" :
//            print("게임기록")
//            print("\(BaseBallGame.gameCount)번째 게임 : 시도횟수 - \(BaseBallGame.tryCountNum))")
//        case "3" :
//            print("종료")
//        default :
//            print("올바른 숫자를 입력해주세요!")
//        }
//
//
//}


