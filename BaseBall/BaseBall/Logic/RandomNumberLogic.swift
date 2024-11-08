//
//  RandomNumberLogic.swift
//  BaseBall
//
//  Created by 진욱의 Macintosh on 11/7/24.
//

import Foundation


class RandomNumberLogic {
    
    var randomNumber = 0
    var randomArray:[Int] = []

    var saveRandomNum = 0
    
    func createRadomNumber() {
        print(#function)
        repeat {
            // 세자리수중 10의자리 0, 1의자리 0이 나오는것들 제외하는 로직
            randomNumber = Int.random(in: 100...999)
            if (randomNumber%100 != 0 && randomNumber > 100) {
                print(randomNumber)
                saveRandomNum = randomNumber
                return
            }
            continue
            
        }while(true)
        
    }
    
    //랜덤값 추출로직
    func getRadomNumberArray() -> [Int] {
        print(#function)
        
        repeat {
            randomArray = [] // 랜덤 숫자를 생성한다면, 기존배열 초기화
            
            while(saveRandomNum > 0) { //랜덤 숫자를 배열에 담는 로직.
                randomArray += [saveRandomNum%10]
                saveRandomNum /= 10
            }
            randomArray = randomArray.reversed()
            
            // 세자리수중 겹치는 수가 존재한다면, 로직반복 ex). 133이 나오면 반복
        }while(Set(randomArray).count != 3)
        

        return randomArray
    }
    
    
}
