//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이준혁 on 2022/06/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: Any) {
        lblHello.text = "Hello, " + txtName.text!
    }
}

