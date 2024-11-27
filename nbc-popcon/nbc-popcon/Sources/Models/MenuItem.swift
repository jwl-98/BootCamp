//
// Untitled.swift
// nbc-popcon
//
// Created by MaxBook on 11/25/24.
//
import Foundation
struct MenuItem {
    
  let assetName: String
  let category: Category
  let name: String
  let price: Int
    
  static let data: [MenuItem] = [MenuItem(assetName: "microphone.fill",
                      category: .communication,
                      name: "마이크", price: 1000),
                  MenuItem(assetName: "message.fill",
                      category: .communication,
                      name: "말풍선", price: 1000),
                  MenuItem(assetName: "phone.fill",
                      category: .communication,
                      name: "전화", price: 1000),
                  MenuItem(assetName: "video.fill",
                      category: .communication,
                      name: "카메라", price: 1000),
                  MenuItem(assetName: "wifi",
                      category: .communication,
                      name: "와이파이", price: 1000),
                  MenuItem( assetName: "wifi.slash",
                       category: .communication,
                       name: "와이파이 꺼짐", price: 1000),
                  MenuItem(assetName: "wifi.exclamationmark",
                      category: .communication,
                      name: "와이파이 오류", price: 1000),
                  MenuItem(assetName: "pencil",
                      category: .tool,
                      name: "연필", price: 1000),
                  MenuItem(assetName: "eraser",
                      category: .tool,
                      name: "지우개", price: 1000),
                  MenuItem(assetName: "trash.fill",
                      category: .tool,
                      name: "쓰레기통", price: 1000),
                  MenuItem(assetName: "folder.fill",
                      category: .tool,
                      name: "폴더", price: 1000),
                  MenuItem(assetName: "paperplane.fill",
                      category: .tool,
                      name: "종이비행기", price: 1000),
                  MenuItem(assetName: "document.fill",
                      category: .tool,
                      name: "문서", price: 1000),
                  MenuItem(assetName: "heart.fill",
                      category: .health,
                      name: "하트", price: 1000),
                  MenuItem(assetName: "stethoscope",
                      category: .health,
                      name: "청진기", price: 1000),
                  MenuItem(assetName: "bed.double.fill",
                      category: .health,
                      name: "침대", price: 1000),
                  MenuItem(assetName: "syringe.fill",
                      category: .health,
                      name: "주사기", price: 1000),
                  MenuItem(assetName: "pill.fill",
                      category: .health,
                      name: "알약", price: 1000)
  ]
}
