//
//  SuguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class SuguePresentViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.lblName.text = name
            self.lblName.sizeToFit()
        }
    }
    
    @IBAction func btnBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
