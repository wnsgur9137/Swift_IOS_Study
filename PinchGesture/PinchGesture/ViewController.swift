//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이준혁 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPinch: UILabel!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizer.State.began) {
            initialFontSize = lblPinch.font.pointSize
        } else {
            lblPinch.font = lblPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

