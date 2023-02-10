//
//  Coordinator.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/09.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
