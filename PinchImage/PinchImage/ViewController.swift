//
//  ViewController.swift
//  PinchImage
//
//  Created by 이준혁 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgPinch: UIImageView!
    
    var initialFontSize:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }


}

