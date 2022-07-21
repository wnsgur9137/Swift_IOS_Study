//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 이준혁 on 2022/07/20.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var lblName: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController is loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController is disappeared")
    }

    @IBAction func btnCodePush(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else { return }
        
        viewController.name = "JunHyeok"
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func btnCodePresent(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else { return }
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "JunHyeok"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SuguePushViewController {
            viewController.name = "JunHyeok"
        } else if let viewController = segue.destination as? SuguePresentViewController {
            viewController.name = "JunHyeok1"
        }
    }
    
    func sendData(name: String) {
        self.lblName.text = name
        self.lblName.sizeToFit()
    }
}

