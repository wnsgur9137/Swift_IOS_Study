//
//  MainCoordinator.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/09.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, Buying, AccountCreating, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        vc.buyAction = { [weak self] in
            self?.buySubscription()
        }
        vc.createAccountAction = { [weak self] in
            self?.createAccount()
        }
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buyView() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccountView(to productType: Int) {
        let vc = CreateAccountViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func codeBaseVC() {
        let vc = CodeBaseViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
    
    func buySubscription() {
        <#code#>
    }
    
    func createAccount() {
        <#code#>
    }
}
