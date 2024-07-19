//
//  Enum.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import Foundation

struct Item: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

enum Settings: CaseIterable {
    case all
    case personal
    case etc
    
    var title: String {
        switch self {
        case .all:
            "전체 설정"
        case .personal:
            "개인 설정"
        case .etc:
            "기타"
        }
    }
    
    var items: [Item] {
        switch self {
        case .all:
            [Item(name: "공지사항", image: "megaphone"),
             Item(name: "실험실", image: "testtube.2"),
             Item(name: "버전 정보", image: "v.circle")]
        case .personal:
            [Item(name: "개인/보안", image: "lock"),
             Item(name: "알림", image: "bell.badge"),
             Item(name: "채팅", image: "text.bubble"),
             Item(name: "멀티프로필", image: "person.2")]
        case .etc:
            [Item(name: "고객센터/도움말", image: "phone")]
        }
    }
    
}

