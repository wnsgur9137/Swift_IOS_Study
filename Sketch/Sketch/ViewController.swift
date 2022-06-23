//
//  ViewController.swift
//  Sketch
//
//  Created by 이준혁 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    var lastPoint: CGPoint!
    var lineSize:CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    @IBOutlet weak var txtLineSize: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch       // 현재 발생한 터치 이벤트를 가지고 온다.
        let currPoint = touch.location(in: imgView) // 터치된 위치를 currPoint로 가지고 온다.
        
        // 현재 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그린다.
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        // 이전에 이동된 위치인 lastPoint로 시작 위치를 이동.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        // lastPoint에서 현재 위치인 currPoint까지 선을 추가.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint   // 현재 터치된 위치를 lastPoint라는 변수에 할당.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func btnBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
    @IBAction func btnLineSizeChange(_ sender: UITextField) {
        lineSize = CGFloat(Int(txtLineSize.text!)!)
    }
    
    @IBAction func btnLineTouchDown(_ sender: UITextField) {
        txtLineSize.selectAll(UITextField.self)
    }
}
