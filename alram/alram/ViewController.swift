//
//  ViewController.swift
//  Alram
//
//  Created by 이준혁 on 2022/06/17.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var currentTime:String = ""
    var pickerTime:String = ""
    var count = 0
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblPickerTime.text = formatter.string(from: datePickerView.date)
        
        let pickerTimeFormatter = DateFormatter()
        pickerTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        pickerTime = pickerTimeFormatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate() // 현재 시간을 가져옴
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = formatter.string(from: date as Date)
        
        let currentTimeFormatter = DateFormatter()
        currentTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        currentTime = currentTimeFormatter.string(from: date as Date)
        
        print("currentTime", currentTime)
        print("pickerTime", pickerTime)
        
        if currentTime == pickerTime {
            if count == 0 {
                let alramAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
                let alramAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                alramAlert.addAction(alramAction)
                present(alramAlert, animated: true, completion: nil)
                count = 1
            }
        }
        else {
            count = 0
        }
    }
}

