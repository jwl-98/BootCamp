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
    
 
    func saveRecord() {
       //시도횟수를 차곡차곡 배열에 담는다.
        print(#function)
        saveTryCountNumArr += [tryCountNum]
        saveGameCountArr += [gameCount]
   }
    
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
