//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnChangeColor(_ sender: UIButton) {
        self.viewColor.backgroundColor = UIColor.blue
        print("색상 변경 버튼이 클릭되었음")
    }
    
}

