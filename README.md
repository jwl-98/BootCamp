# 3W-CalculatorApp
3주차 계산기앱

<img width="714" alt="스크린샷 2024-11-15 오후 12 21 28" src="https://github.com/user-attachments/assets/b0dd299e-9d8f-4d82-a69a-6eca372b8487">

LV.1 ~ LV.5 까지는 필수 구현으로 UI 작업입니다.  
LV.6 ~ Lv.8 까지는 도전 구현으로 계산기의 기본적인 로직을 추가하는 작업입니다.  

Swift 와 UIkit을 통해 작업했습니다.


## LV.1 2024.11.15
<img width="704" alt="스크린샷 2024-11-15 오후 12 23 42" src="https://github.com/user-attachments/assets/caa0d0c8-fca8-4047-b3ca-12d4892c758c">

### 구현
#### [커밋a7994ac](https://github.com/jwl-98/3W-CalculatorApp/commit/a7994aca081f01493e810d3dc58df1123a5a2389)
코드베이스로 UI작업을 하기위한 UIView를 상속한 CocoaTouch클래스를 이용했습니다.  
상속했기에 기본 뷰의 설정을 재정의 해서 init(frame: CGRect) 커스텀한 설정들을 추가하도록 구현했습니다.  
실행됐을때 바로 설정한 화면을 표시하기 위해서  ViewController 내에서 
view를 관리하는 메서드중 하나인 loadView 메서드를 재정의해서 기존에 존재하는 view를 CalculatorView로 할당해줬습니다.
****

## LV.2 2024.11.15
<img width="722" alt="스크린샷 2024-11-15 오후 3 33 04" src="https://github.com/user-attachments/assets/b32d9295-043e-4b7d-8450-d9c339f7410b">

### 구현
#### [커밋bb2e7f8](https://github.com/jwl-98/3W-CalculatorApp/commit/bb2e7f85cd2ecf874099df9bae122aa3b1b043bc)
반복문을 통해서 레이블의 갯수만큼 버튼을 생성했습니다.   
생성과 동시에 레이블이 입력됩니다.  
생성한 버튼을 `[UIButton]` 타입으로 담아서 반환합니다.


## LV.3 2024.11.17 
<img width="711" alt="스크린샷 2024-11-17 오후 5 05 09" src="https://github.com/user-attachments/assets/0637dcf4-cae9-4acc-ae8f-98d4cfb9f4a0">

#### [커밋1e70e0c](https://github.com/jwl-98/3W-CalculatorApp/commit/1e70e0ce3d5f3d8ff821f7e2d27a107b8b210efd)

### 구현
verticalStackView를 생성했습니다.
horizontalStackView에서 4개의 버튼씩 스택뷰에 추가합니다. 반복문을 통해서 4개의 스택뷰를 생성했습니다.  
이 반복문을 기준으로 내부에 saveButton 변수에는 버튼의 인덱스 넘버를 기반으로 버튼들을 저장합니다.
그리고 verticalStackView에서 스택뷰 인스턴스 생성시 horizontalStackView를 서브뷰로 추가해 verticalStackView를 생성했습니다.

## 오토레이아웃 설정변경
<img width="927" alt="스크린샷 2024-11-17 오후 5 14 46" src="https://github.com/user-attachments/assets/7f9a038c-1154-4184-8c09-d4b3808de8a2">
horizontalStackView 높이, 너비 규약을 유지하고자 반복문을 추가해줬습니다.
VerticalStackView의 오토레이아웃 설정을 추가해줬습니다.  
기존에 verticalStackView에 있던 mainLabel을 기준으로 한 규약은 VerticalStackView를 추가하면서 기준을 다시 잡아야 한다고 생각해 VerticalStackView의 오토레이아웃 설정에 넣어줬습니다.
동시에 높이 규약도 설정해줬습니다.

## LV.4 2024.11.17 
<img width="741" alt="스크린샷 2024-11-17 오후 8 00 58" src="https://github.com/user-attachments/assets/04bda86b-3664-45cc-bdaa-88fafe6e40c4">

#### [커밋74f7099](https://github.com/jwl-98/3W-CalculatorApp/commit/74f709917966e089de0289917fc0619eec70ae61)
tree브랜치에서 작업을 시작했습니다.

### 구현 
버튼색상을 변경해주는 함수를 추가했습니다.
파라미터로 UIButton타입을 받아서 색상을 변경하고 return해주는 함수입니다.
함수 구현 시점은 버튼의 레이블이 전부 설정된 상태에서 함수를 호출한후. 
함수내에서 현재의 타이틀(레이블)을 검사합니다.  
버튼에 있는 레이블이 Int형으로 형변환이 불가능하면 버튼을 오렌지 색으로 변경합니다.


## LV.5 2024.11.17 
<img width="738" alt="스크린샷 2024-11-17 오후 8 33 15" src="https://github.com/user-attachments/assets/d917edc2-77b1-44d6-bf47-58e690c7f370">

### 구현
cornerRadius속성에 정사각형의 버튼의 절반 값을 할당하여 원형 버튼을 구현했습니다.


## LV.6 2024.11.17
<img width="724" alt="스크린샷 2024-11-17 오후 8 54 35" src="https://github.com/user-attachments/assets/193f5573-cd7b-4c44-94d7-4fc881c1d589">

#### [커밋58492a3](https://github.com/jwl-98/3W-CalculatorApp/commit/58492a33a73703f33052ba259562211c47620e97)
### 구현
버튼을 누르는대로 표시해야하기에 뭔가 누적시켜 저장해야 될 변수가 필요하다고 생각했습니다.  
accumulateNumberButton을 함수 외부에 선언시켜줬습니다.  
버튼의 타이틀을 전달받아 해당 변수에 누적 시켜 저장합니다.
버튼의 동작연결은 addTarget메서드로 구현했습니다.
