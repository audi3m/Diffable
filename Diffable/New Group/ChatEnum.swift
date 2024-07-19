//
//  ChatEnum.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import Foundation

struct Friend: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let lastChat: String
}

enum Chat: CaseIterable {
    case all
    
    var title: String {
        switch self {
        case .all:
            "전체"
        }
    }
    
    var friends: [Friend] {
        switch self {
        case .all:
            [
                Friend(name: "안야 테일러조이", image: "figure.walk.circle", lastChat: "안녕하세요, 잘 지내고 있나요? 안녕하세요, 잘 지내고 있나요? 안녕하세요, 잘 지내고 있나요?"),
                Friend(name: "크리스 헴스워스", image: "figure.badminton", lastChat: "오늘 저녁에 뭐해요?"),
                Friend(name: "조지 밀러", image: "figure.cross.training", lastChat: "조만간 만나요!"),
                Friend(name: "샤를리즈 테론", image: "figure.outdoor.cycle", lastChat: "프로젝트 다 끝났어요?"),
                Friend(name: "러치 험", image: "figure.open.water.swim", lastChat: "생일 축하해요!"),
                Friend(name: "네이선 존스", image: "figure.sailing", lastChat: "오랜만이에요!")
            ]
        }
    }
    
}
