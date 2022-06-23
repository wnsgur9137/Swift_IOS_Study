//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 이준혁 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    let numOfTouches = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgUp.append(UIImage(named: "./images/arrow-up-black.png")!)
        imgUp.append(UIImage(named: "./images/arrow-up-red.png")!)
        imgUp.append(UIImage(named: "./images/arrow-up-green.png")!)
        imgDown.append(UIImage(named: "./images/arrow-down-black.png")!)
        imgDown.append(UIImage(named: "./images/arrow-down-red.png")!)
        imgDown.append(UIImage(named: "./images/arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "./images/arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "./images/arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "./images/arrow-left-green.png")!)
        imgRight.append(UIImage(named: "./images/arrow-right-black.png")!)
        imgRight.append(UIImage(named: "./images/arrow-right-red.png")!)
        imgRight.append(UIImage(named: "./images/arrow-right-green.png")!)
        
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        // 상수 선언, 액션 인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // 위에서 선언한 상수 swipeUp의 direction 속성 설정(up)
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
//        swipeUp.numberOfTouchesRequired = numOfTouches // 두 손가락으로 터치
        // 뷰 객체의 메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
//        swipeDown.numberOfTouchesRequired = numOfTouches // 두 손가락으로 터치
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        swipeLeft.numberOfTouchesRequired = numOfTouches // 두 손가락으로 터치
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        swipeRight.numberOfTouchesRequired = numOfTouches // 두 손가락으로 터치
        self.view.addGestureRecognizer(swipeRight)
        
        
        // 두 손가락으로 터치
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRightMulti)
        
        
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }

}

