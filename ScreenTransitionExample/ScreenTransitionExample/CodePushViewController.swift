//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
