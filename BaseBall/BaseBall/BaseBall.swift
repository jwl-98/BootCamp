//
//  BaseBall.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation

class BaseBallGame {
    
    let ui = UserInterface()
    let randomLogic = RandomNumberLogic()
    
    //데이터 전달을 위한 GameLogic, UserInputData 타입의 변수
    let logic:  GameLogic
    let menuInputData : UserInputData
    
    let data = Data()
    
    /*생성자를 통해 게GameLogic과  UserInputData에 데이터를 전달합니다.
    Data()를 사용하는곳은 이 두가지 클래스 입니다. */
    
    
    init() {
        self.logic = GameLogic(copyData: data)
        self.menuInputData = UserInputData(copyeData: data)
        }
    
/*시작하게 되면
 메뉴 출력
 메뉴 넘버를 입력 받음
 입력값은 switch문으로 전달되어 각 입력값에 맞는 함수를 실행합니다.
 1번은 게임횟수를 증가시키며 게임 로직을 실행합니다
 */
    

    func start() {
        while true {
            ui.printMenu()
            let menuInput = readLine()
            ui.printMenuNumber(menuNumberInput: menuInput)
            
            switch menuInput {
            case "1":
                data.gameCount += 1
                logic.baseBallGameLogic()
            case "2":
                data.printRecord()
            case "3":
                data.endGame()
                return
            default:
                ui.printErrorUserIn()
            }
        }
        
    }
    

    
}
