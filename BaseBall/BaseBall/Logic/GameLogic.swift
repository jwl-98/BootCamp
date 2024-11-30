//
//  GameLogic.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation

/*실행 흐름은 대략 이렇습니다.
 start() 에서 시작해서 GameLogic이 실행되면
 baseBallGameLogic()내에서 31코드를 만나 랜덤 넘버를 생성하고, 그 넘버를 기준으로 배열을 생성해냅니다.
 그리고 반복문에 진입해 (36)
 유저 인풋을 확인해서 true를 반환 받았다면 실제 로직이 시작되고, 횟수 카운트를 증가시킵니다.
 
 (49) for 문으로 진입해 리턴받은 랜덤숫자 배열을 인덱스 넘버와 요소를 튜플형태로 추출합니다.
 enumerated()를 사용했습니다.
 이는 조건에 따라 스트라이크 넘버와 볼 넘버를 증가 시키기 위함입니다.
 */


class GameLogic {
    
    let ui = UserInterface()
    let userInputData : UserInputData
    let randomLogic = RandomNumberLogic()
    let data : Data
    
    var randomArray : [Int] = []
    
    init(copyData: Data) {
        self.data = copyData
        self.userInputData = UserInputData(copyeData: data)
    }
    
    
    func baseBallGameLogic() {
        self.randomArray = randomLogic.getRadomNumberArray() //랜덤배열 생성후 저장

        print(#function)
        
        repeat {
            //카운트 수가 누적되지 않게 반복문에 들어서면 카운트 초기화가 됩니다.
            var countStrike = 0
            var countBall = 0
            
            //유저의 인풋이 조건에 맞다면 true을 반환하고, 게임 시작.
            if userInputData.checkUserInput() == true {
                data.tryCountNum += 1
                //랜덤숫자의 인덱스와 요소를 튜플의 형태로 추출
                for (Index, Element) in randomArray.enumerated() {
                    
                
                    if userInputData.userNumberArray[Index] == Element  {
                        //유저배열의 인덱스 넘버를 기반으로 요소를 추출
                        //랜덤숫자의 요소와 동일하다면 스트라이크 카운트 1증가
                        countStrike += 1
                    }else if userInputData.userNumberArray.contains(Element) {
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
                    //스트라이크 넘버가 3인 경우 정답이라는 뜻이니
                    //데이터를 저장시키고, 시도횟수를 0으로 초기화 시킨후
                    //"정답" 이라는 문구를 출력합니다.
                    data.saveRecord()
                    data.tryCountNum = 0
                    ui.printCorrect()
                    return
                }
            }else {
                // 조건 이외의 입력값이 입력되면 에러메세지 출력
                ui.printErrorUserIn()
            }
        }while (true)
    }
    
    
}
