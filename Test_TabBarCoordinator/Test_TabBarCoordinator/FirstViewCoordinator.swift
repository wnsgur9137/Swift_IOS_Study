//
//  FirstViewCoordinator.swift
//  Test_TabBarCoordinator
//
//  Created by 이준혁 on 2023/02/10.
//

import UIKit

class FirstViewCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = .init()
    }
    
    func start() {
        
    }
    
    func startPush() -> UINavigationController {
        let firstViewController = FirstViewController()
        firstViewController.delegate = self
        firstViewController.view.backgroundColor = .white
        
        navigationController.setViewControllers([firstViewController], animated: false)
        
        return navigationController
    }
}
