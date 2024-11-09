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
    let logic:  GameLogic
    let menuInputData : UserInputData
    
    let data = Data()
    
    //생성자를 통해서 랜덤숫자 미리 생성
    init() {
        self.logic = GameLogic(copyData: data)
        self.menuInputData = UserInputData(copyeData: data)
        }
    

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
