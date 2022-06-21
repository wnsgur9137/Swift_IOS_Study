//
//  AddViewController.swift
//  Table
//
//  Created by 이준혁 on 2022/06/20.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ITEMS_NUM = itemsImageFile.count
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    var imageName = ""
    
    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ITEMS_NUM {
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        
        imageView.image = imageArray[0]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        if imageName == "" {
            itemsImageFile.append(imageFile[0])
        } else {
            itemsImageFile.append(imageName)
        }
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFile[row].replacingOccurrences(of: "./images/", with: "")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageName = imageFile[row]
        imageView.image = imageArray[row]
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
