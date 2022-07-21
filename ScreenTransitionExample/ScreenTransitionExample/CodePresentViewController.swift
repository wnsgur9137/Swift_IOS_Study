//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate? // delegate 변수 앞에는 weak를 붙인다.(안붙이면 메모리 누수가 발생)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.lblName.text = name
            self.lblName.sizeToFit()
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.delegate?.sendData(name: "JunHyeok")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
