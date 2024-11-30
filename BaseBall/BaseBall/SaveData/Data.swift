////
////  Data.swift
////  BaseBall
////
////  Created by 진욱의 Macintosh on 11/6/24.
////
//
//import Foundation
//
////데이터 처리를 위한 구조체


//게임 횟수, 시도횟수를 저장하기위한 구조체 입니다.
//


class Data {
     var saveGameCountArr: [Int] = []
     var saveTryCountNumArr: [Int] = []
     var tryCountNum = 0 //시도횟수 넘버는 공통으로 공유를 위함
     var gameCount = 0 //게임 횟수
    
 
    /*시도 횟수를 지속적으로 저장해줍니다.
     해당 함수의 실행시점은 
     GameLogic클래스 내  baseBallGameLogic() 함수
     스트라이크 넘버가 3이 됐을때 (정답일때) 실행됩니다.
     */
    
    func saveRecord() {
       //시도횟수를 차곡차곡 배열에 담는다.
        print(#function)
        saveTryCountNumArr += [tryCountNum]
        saveGameCountArr += [gameCount]
   }
    
    /*기록을 출력해줍니다.
     게임시작 횟수만큼 반복해서 출력해줍니다.
     ex) 3번 게임을 했으면 3번 출력됩니다.
     */
    
    func printRecord() {
        print(#function)
        for i in 0..<saveGameCountArr.count {
            print("\(saveGameCountArr[i])번째 게임 : 시도횟수 - \(saveTryCountNumArr[i])")
        }
    }
    
    //해당함수 호출시 카운트 초기화
    func endGame() {
        print(#function)
        tryCountNum = 0
        gameCount = 0
    }
    
}
