//
//  SuguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class SuguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SegueViewController is loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SegueViewController will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SegueViewController will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SegueViewController is disappeared")
    }
    
    @IBAction func btnBackbutton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
