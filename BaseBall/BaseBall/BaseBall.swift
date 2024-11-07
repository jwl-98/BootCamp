//
//  BaseBall.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation

class BaseBallGame {
    
    let ui = UserInterface()
    let menuInputData = UserInputData()
    let randomLogic = RandomNumberLogic()
    let logic: GameLogic
    
    let data = Data()
    
    //생성자를 통해서 랜덤숫자 미리 생성
    init() {
            let randomArray = randomLogic.getRadomNumberArray()
        //게임 로직이 생성되면 데이터, 랜덤배열의 전달
            logic = GameLogic(data: data, userInputData: menuInputData, randomArray: randomArray)
        }
    
    //시작하면 유저 인터페이스를 불러옵니다
    func start() {
        
        ui.printMenu()
        gameSet()

    }
    
    //게임을 준비하는함수입니다.
    //게임카운트가 증가하고, 랜덤배열을 가져옵니다.
    //그리고 게임 로직을 실행해서 실제 게임이 시작됩니다.
    func gameSet() {
        print(#function)
        
        menuInputData.inputMenuNumber()
        data.gameCount += 1
        logic.BaseBallGameLogic()
    }
    
}
