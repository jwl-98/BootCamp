# 3W-CalculatorApp
3주차 계산기앱

<img width="714" alt="스크린샷 2024-11-15 오후 12 21 28" src="https://github.com/user-attachments/assets/b0dd299e-9d8f-4d82-a69a-6eca372b8487">

LV.1 ~ LV.5 까지는 필수 구현으로 UI 작업입니다.
LV.6 ~ Lv.8 까지는 도전 구현으로 계산기의 기본적인 로직을 추가하는 작업입니다.

Swift 와 UIkit을 통해 작업했습니다.


## LV.1 2024.11.15
<img width="704" alt="스크린샷 2024-11-15 오후 12 23 42" src="https://github.com/user-attachments/assets/caa0d0c8-fca8-4047-b3ca-12d4892c758c">

### 구현
코드베이스로 UI작업을 하기위한 UIView를 상속한 CocoaTouch클래스를 이용했습니다.
상속했기에 기본 뷰의 설정을 재정의 해서 init(frame: CGRect) 
커스텀한 설정들을 추가하도록 구현했습니다.
실행됐을때 바로 설정한 화면을 표시하기 위해서 ViewController 내에서 
view를 관리하는 메서드중 하나인 loadView 메서드를 재정의해서 기존에 존재하는 view를 CalculatorView로 할당해줬습니다.

## LV.2 2024.11.15

### 구현
반복문을 통해서 레이블의 갯수만큼 버튼을 생성했습니다. 
생성과 동시에 레이블이 입력됩니다.
생성한 버튼을 `[UIButton]` 타입으로 담아서 반환합니다.
