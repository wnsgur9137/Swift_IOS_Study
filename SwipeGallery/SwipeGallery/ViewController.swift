//
//  ViewController.swift
//  SwipeGallery
//
//  Created by 이준혁 on 2022/06/23.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: "images/" + images[0])
        
        // 상수 선언, 액션 인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // 위에서 선언한 상수 swipeUp의 direction 속성 설정(up)
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        // 뷰 객체의 메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: "images/" + images[pageControl.currentPage])
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    if (pageControl.currentPage<pageControl.numberOfPages-1) {
                        pageControl.currentPage = pageControl.currentPage + 1
                    } else {
                        pageControl.currentPage = 0
                    }
                    print("page: ", pageControl.currentPage)
                    print("Swiped Left")
                case UISwipeGestureRecognizer.Direction.right:
                    if (pageControl.currentPage>0) {
                        pageControl.currentPage = pageControl.currentPage - 1
                    } else {
                        pageControl.currentPage = pageControl.numberOfPages - 1
                    }
                    print("page: ", pageControl.currentPage)
                    print("Swiped Right")
                default:
                    break
                }
                
                imgView.image = UIImage(named: "./images/" + images[pageControl.currentPage])
            }
        }
}

