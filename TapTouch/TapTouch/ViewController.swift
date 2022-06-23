//
//  ViewController.swift
//  TapTouch
//
//  Created by 이준혁 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTapCount: UILabel!
    @IBOutlet weak var lblTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 터치가 시작될 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch       // 현재 발생한 터치 이벤트를 가지고 온다.
        lblMessage.text = "Touches Began"
        lblTapCount.text = String(touch.tapCount)   // touches 세트 안에 포함된 터치의 개수를 출력
        lblTouchCount.text = String(touches.count)  // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 출력
    }
    
    // 터치된 손가락이 움직였을 때 호출
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch       // 현재 발생한 터치 이벤트를 가지고 온다.
        lblMessage.text = "Touches Moved"
        lblTapCount.text = String(touch.tapCount)   // touches 세트 안에 포함된 터치의 개수를 출력
        lblTouchCount.text = String(touches.count)  // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 출력
    }
    
    // 화면에서 손가락을 떼었을 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch       // 현재 발생한 터치 이벤트를 가지고 온다.
        lblMessage.text = "Touches Ended"
        lblTapCount.text = String(touch.tapCount)   // touches 세트 안에 포함된 터치의 개수를 출력
        lblTouchCount.text = String(touches.count)  // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 출력
    }


}

