//
//  Tab.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import UIKit

class MainTab: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1 = ChatList()
        let tab2 = SettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "quote.bubble"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape"), tag: 1)
        
        viewControllers = [nav1, nav2]
        
    }
    
}
