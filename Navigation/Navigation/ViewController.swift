//
//  ViewController.swift
//  Navigation
//
//  Created by 이준혁 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "./images/lamp_on.png")
    let imgOff = UIImage(named: "./images/lamp_off.png")
    
    var isOn = true
    var isZoom = false
    
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar Button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            self.isOn = true
            imgView.image = imgOn
        } else {
            self.isOn = false
            imgView.image = imgOff
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
//        let scale:CGFloat = 2.0
//        var newWidth:CGFloat, newHeight:CGFloat
        let resizeValue = 1.5
        
        if isZoom {
            self.isZoom = true
//            newWidth = imgView.frame.width*scale
//            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: 240*resizeValue, height: 300*resizeValue)
        } else {
            self.isZoom = false
//            newWidth = imgView.frame.width/scale
//            newHeight = imgView.frame.height/scale
            imgView.frame.size = CGSize(width: 240, height: 300)
        }
        
//        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
}

