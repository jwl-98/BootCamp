//
// Untitled.swift
// nbc-popcon
//
// Created by MaxBook on 11/25/24.
//
import Foundation

struct MenuItem {
    let name: String            // 사용자에게 노출되는 심볼의 이름
    let price: Int              // 가격
    let symbolId: String          // 실제 심볼을 사용하기 위한 심볼 고유 아이디값
    let description: String     // 해당 심볼에 대한 간략한 한글 설명.
    let category: Category    // 해당 아이콘이 포함된 카테고리 이름
    
    init(name: String, price: Int, symbolId: String, description: String, categoryName: String) {
        self.name = name
        self.price = price
        self.symbolId = symbolId
        self.description = description
        self.category = Category(rawValue: categoryName)
    }
    
    static let menuItems: [MenuItem] = [
        // 통신 카테고리
        MenuItem(
            name: "전화기",
            price: 1500,
            symbolId: "phone.fill",
            description: "수화기가 있는 전화를 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "메시지",
            price: 1600,
            symbolId: "message.fill",
            description: "말풍선 형태의 메시지를 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "메일",
            price: 1700,
            symbolId: "envelope.fill",
            description: "봉투 모양의 이메일을 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "비디오 통화",
            price: 1800,
            symbolId: "video.fill",
            description: "비디오 카메라를 나타내는 아이콘으로, 영상 통화를 의미합니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "안테나",
            price: 1900,
            symbolId: "antenna.radiowaves.left.and.right",
            description: "전파를 송수신하는 안테나를 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "와이파이",
            price: 2000,
            symbolId: "wifi",
            description: "무선 인터넷 연결을 나타내는 와이파이 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "블루투스",
            price: 2100,
            symbolId: "dot.radiowaves.left.and.right",
            description: "블루투스 연결을 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "QR 코드",
            price: 2200,
            symbolId: "qrcode",
            description: "QR 코드를 스캔하는 기능을 나타내는 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "링크",
            price: 2300,
            symbolId: "link",
            description: "하이퍼링크를 나타내는 체인 모양의 아이콘입니다.",
            categoryName: "통신"
        ),
        MenuItem(
            name: "공유",
            price: 2400,
            symbolId: "square.and.arrow.up",
            description: "상자를 통해 위로 화살표가 나가는 공유 아이콘입니다.",
            categoryName: "통신"
        ),
        
        // 사물 및 도구 카테고리
        MenuItem(
            name: "가위",
            price: 2500,
            symbolId: "scissors",
            description: "종이나 천을 자르는 가위를 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "연필",
            price: 2600,
            symbolId: "pencil",
            description: "글씨를 쓰거나 그림을 그리는 연필을 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "자물쇠",
            price: 2700,
            symbolId: "lock.fill",
            description: "잠금 상태를 나타내는 자물쇠 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "열쇠",
            price: 2800,
            symbolId: "key.fill",
            description: "문을 여는 열쇠를 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "배터리",
            price: 2900,
            symbolId: "battery.100",
            description: "배터리의 충전 상태를 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "손전등",
            price: 3000,
            symbolId: "flashlight.on.fill",
            description: "켜진 상태의 손전등을 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "시계",
            price: 3100,
            symbolId: "clock.fill",
            description: "시간을 나타내는 아날로그 시계 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "카메라",
            price: 3200,
            symbolId: "camera.fill",
            description: "사진을 찍는 카메라를 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "가방",
            price: 3300,
            symbolId: "bag.fill",
            description: "물건을 담는 가방을 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        MenuItem(
            name: "컴퓨터",
            price: 3400,
            symbolId: "desktopcomputer",
            description: "데스크탑 컴퓨터를 나타내는 아이콘입니다.",
            categoryName: "사물 및 도구"
        ),
        
        // 건강 카테고리
        MenuItem(
            name: "하트",
            price: 3500,
            symbolId: "heart.fill",
            description: "사랑을 상징하는 하트 모양의 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "심전도",
            price: 3600,
            symbolId: "waveform.path.ecg",
            description: "심전도 그래프를 나타내는 아이콘으로, 심장 박동을 의미합니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "약",
            price: 3700,
            symbolId: "pills.fill",
            description: "알약 형태의 약을 나타내는 아이콘으로, 약물 복용을 상징합니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "체온계",
            price: 3800,
            symbolId: "thermometer",
            description: "온도를 측정하는 체온계를 나타내는 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "운동",
            price: 3900,
            symbolId: "figure.walk",
            description: "걷는 동작을 하는 사람을 나타내는 아이콘으로, 운동을 상징합니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "영양소",
            price: 4000,
            symbolId: "leaf.fill",
            description: "건강과 자연을 상징하는 잎사귀 모양의 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "구급차",
            price: 4100,
            symbolId: "cross.fill",
            description: "의료 응급 상황에 사용되는 구급차를 상징하는 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "청진기",
            price: 4200,
            symbolId: "stethoscope",
            description: "의사가 사용하는 청진기를 나타내는 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "병원",
            price: 4300,
            symbolId: "building.2.crop.circle",
            description: "병원 건물을 상징하는 아이콘으로, 의료 기관을 나타냅니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "휴식",
            price: 4400,
            symbolId: "bed.double.fill",
            description: "잠이나 휴식을 상징하는 침대 모양의 아이콘입니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "심박수",
            price: 4500,
            symbolId: "heart.text.square.fill",
            description: "심박수를 나타내는 아이콘으로, 심장의 건강 상태를 의미합니다.",
            categoryName: "건강"
        ),
        MenuItem(
            name: "공유", price: 3000, symbolId: "square.and.arrow.up.circle", description: "외부로의 공유를 의미합니다", categoryName: "기타")
    ]
    
}
