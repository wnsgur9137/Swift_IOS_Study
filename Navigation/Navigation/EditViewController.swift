//
//  EditViewController.swift
//  Navigation
//
//  Created by 이준혁 on 2022/06/20.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var swZoom: UISwitch!
    @IBOutlet weak var lblResize: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = self.isOn
        swZoom.isOn = isZoom
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        _=navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func swImageResize(_ sender: UISwitch) {
        if sender.isOn {
            isZoom = true
//            lblResize.text = "축소"
        } else {
            isZoom = false
//            lblResize.text = "확대"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
