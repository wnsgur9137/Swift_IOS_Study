//
//  ViewController.swift
//  Test_Coordinator
//
//  Created by 이준혁 on 2023/02/09.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var buyAction: (() -> Void)?
    var createAccountAction: (() -> Void)?
    
    @IBOutlet weak var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyButtonTapped(_ sender: Any) {
//        coordinator?.buyView()
        buyAction?()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
//        coordinator?.createAccountView(to: product.selectedSegmentIndex)
        createAccountAction?()
    }
    @IBAction func codeBaseVCTapped(_ sender: Any) {
        coordinator?.codeBaseVC()
    }
}

