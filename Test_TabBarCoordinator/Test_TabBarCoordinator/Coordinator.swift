//
//  Coordinator.swift
//  Test_TabBarCoordinator
//
//  Created by 이준혁 on 2023/02/10.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
