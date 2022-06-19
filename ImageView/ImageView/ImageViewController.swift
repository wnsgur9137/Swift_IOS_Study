//
//  ViewController.swift
//  ImageView
//
//  Created by 이준혁 on 2022/06/16.
//

import UIKit

class ImageViewController: UIViewController {

    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    var numImage = 1
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
    @IBAction func left(_ sender: UIButton) {
        numImage -= 1
        if numImage <= 0 {
            numImage = 6
        }
        imgView.image = UIImage(named: "images" + String(numImage) + ".png")
        
    }
    
    @IBAction func right(_ sender: UIButton) {
        numImage += 1
        if numImage >= 7 {
            numImage = 1
        }
        imgView.image = UIImage(named: "images" + String(numImage) + ".png")
    }
    
}
