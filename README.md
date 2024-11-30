# NBC : POPCON - 아이콘 키오스크

![키오스크 만들기](https://imagedelivery.net/goza06089fZJqNysJE56Uw/6ed19d8c-5e97-4545-4af2-fed3d47fd900/public)
![Simulator Screen Recording - iPhone 16 Pro - 2024-11-29 at 16 43 47](https://github.com/user-attachments/assets/4a9cadb7-5647-47d2-b320-b014385ca63c)


## Project Information
  - 프로젝트명 : 내배캠 iOS 5기 week 6 팀 협업 프로젝트인 키오스크 만들기
  - 프로젝트 소개 : 
    - 코드베이스의 UIKit을 활용하여 터치로 동작하는 키오스크 iOS 앱을 만들어 보자.
    - 앱 개발 중 사용 가능한 apple의 SF Symbols를 소개하고 판매하는(척을 하는) 앱을 만들자.
    - 해당 앱을 통해 여러가지 심볼들을 소개받고 살펴볼 수 있습니다.
    - **애플 아이콘 : https://developer.apple.com/sf-symbols/**
    - 프로젝트 기간 : 2024. 11. 25 - 2024. 11. 29
  - [프로젝트 노션 페이지 바로가기](https://seongto.notion.site/Team-Project-Popcon-149a2764a6578011bcf3e4f1be7550f3?pvs=4)
 <br><br><br>

## 팀원 및 담당 역할

| 팀원    | 담당 역할                                         |
|---------|--------------------------------------------------|
| 반성준    | 뷰모델(키오스크), 뷰컨트롤러                    |
| 서문가은 | 메뉴 아이템 뷰, 메뉴 디테일 뷰 (모달)           |
| 이진욱    | 오더 버튼 뷰, 깃(Git) 관리                       |
| 이재영    | 메뉴 카테고리, 다크모드                          |
| 이재훈    | 카트 뷰, CartModalViewController                 |
| 임성수    | 디자인, ModalManager                             |

<br><br><br>

## 주요 기능 소개

1. 아이템 선택 및 상세보기
- `CollectionView`를 사용하여 메뉴 아이템을 구현했습니다.
- `CollectionViewCell`에 `UIButton`을 추가하여 상세보기 기능을 구현했습니다.

2. 장바구니 추가, 수정 및 삭제
- 메뉴 아이템 선택 시 장바구니 데이터에 선택 사항을 저장하며, 저장된 데이터에 대해 수량 조절 및 삭제 기능을 제공합니다.
- 장바구니에 저장된 항목 전체 삭제 또는 구매 기능을 지원하며, 구매 완료 시 경고 팝업을 띄우는 기능을 구현했습니다.

3. 직원 호출
- 직원 호출 버튼을 추가하여, 호출 시 경고 팝업으로 직원 호출 알림을 제공합니다.

4. 메뉴 아이템 및 테마 선택 시 모달 화면 전환
- `ModalManager`를 활용하여 모달 뷰를 쉽게 호출할 수 있도록 설계했습니다.

5. **SF Symbols 6** 애니메이션 효과
- `addSymbolEffect`를 사용하여 아이콘에 애니메이션 효과를 적용했습니다.

6. 글로벌 모달 뷰 컨트롤러
- 설정 및 메뉴 상세보기 화면을 위한 글로벌 모달 뷰 컨트롤러를 구현했습니다.

7. 전역 함수 및 경고창
- 어느 파일에서든 최상위 루트 뷰컨트롤러에 접근할 수 있는 전역 함수를 제공합니다.
- 경고창 띄우기 기능을 추가하여 다양한 상황에서 경고 메시지를 표시합니다.

8. 테마 관리자
- 테마 관련 상수값(색상, 폰트 등)을 중앙에서 관리하기 위한 **테마 관리자**를 구현했습니다.
 <br><br><br>

## Project Structure
```
nbc-popcon
├── Resources
│   ├── Assets
│   │   └── Assets
│   └── ThemeManager
│       ├── ThemeColors.swift
│       ├── ThemeFonts.swift
│       ├── ThemeManager.swift
│       ├── ThemeMode.swift
│       └── ThemeNumbers.swift
├── Sources
│   ├── Cells
│   │   ├── CartItemButtonCell.swift
│   │   └── MenuItemButtonCell.swift
│   ├── Classes
│   │   └── PopconViewController.swift
│   ├── Extensions
│   │   └── UILabelExtension.swift
│   ├── ModalViewControllers
│   │   ├── CartModalViewController.swift
│   │   └── GlobalModalViewController.swift
│   ├── Models
│   │   ├── CartItem.swift
│   │   ├── Category.swift
│   │   └── MenuItem.swift
│   ├── Utilities
│   │   ├── AppHelpers.swift
│   │   ├── ModalManager.swift
│   │   └── PriceFormat.swift
│   ├── ViewControllers
│   │   └── ViewController.swift
│   ├── ViewModels
│   │   └── Kiosk.swift
│   └── Views
│       ├── CartView.swift
│       ├── HeaderView.swift
│       ├── MenuItemDetailView.swift
│       ├── MenuView.swift
│       ├── OrderButtonsView.swift
│       └── ThemeSelectView.swift
├── Info.plist
└── LaunchScreen.storyboard

Package Dependencies:
- ALRadioButtons 1.2.2
- SnapKit 5.7.1
```
 <br><br><br>

## Git Management
- **Git 브랜치 관리는 이렇게 하자!**
    - 항상 원격저장소를 기준으로 관리한다. 로컬에서 무언가를 만들려고 하지 않는다. 브랜치도 귀찮지만 원격에서 만들고 switch하자.
    - main과 develop 브랜치에 곧바로 push 하지 않습니다.
    - main과 develop 브랜치는 깃 리더 및 리뷰어만 merge를 수행합니다.
    - main과 develop 브랜치에서 아무 코드도 수정하지 않습니다. 이 두 브랜치는 merge 만 받습니다.
    - main 브랜치는 오직 develop 브랜치만 merge합니다. feature 등의 브랜치는 develop에 merge합니다.
    - 자신이 만든 브랜치에 푸시를 한 후 풀리까지 작성하고, merge 하지 않고 깃 리더에게 이를 알려줍니다.
- **원격저장소 푸시 및 풀 리퀘스트 운영 요령**
    - 너무 많은 변경을 쌓아두었다가 한번에 반영하지 않는다. 일을 최소한의 단위로 쪼개어 하나씩 달성해가는 방향으로 진행합시다.
    - 커밋컨벤션을 지켜서 각 커밋마다 타입과 타이틀, 내용을 최소한으로는 작성하도록 합시다.
    - 항상 원격저장소에 push 하기 전 `git pull` 을 실행합니다. 컨플릭트 발생 시 해결 후 또 실행합니다.
    - 원격저장소로부터 git pull 을 할때는 가급적 히스토리 보존을 위해 `merge` 전략을 선택해 주세요.
    - 주기적으로 코드 싱크를 맞추기 위해 모두 함께 `git pull` 을 실행하도록 합니다. 또한 주요한 업데이트가 있을 때도 합니다.
- **원격저장소 관리 담당**
    - **깃 리더 : 이진욱**
    - 깃 리뷰어 : 반성준, 이재영, 임성수
 <br><br><br>


## 개발 환경 및 기술 스택
- **개발 환경:** Xcode 16+, iOS 18
- **UI 프레임워크:** UIKit
- **버전 관리:** Git
- **디자인:** Figma
 <br><br><br>
 

## 프로젝트 현황
- 프로젝트 현황은 아래의 노션 페이지를 참고하세요.
- [프로젝트 노션 페이지 바로가기](https://seongto.notion.site/Team-Project-Popcon-149a2764a6578011bcf3e4f1be7550f3?pvs=4)
