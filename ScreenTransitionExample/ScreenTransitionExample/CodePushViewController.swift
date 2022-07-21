//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.lblName.text = name
            self.lblName.sizeToFit()
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
