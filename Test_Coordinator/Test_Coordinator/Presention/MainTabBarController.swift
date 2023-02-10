//
//  MainTabBarController.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/10.
//

import UIKit

class MainTabBarController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.start()
        viewControllers = [main.navigationController]
    }
}
