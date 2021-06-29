//
//  RaceViewController.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 27.06.2021.
//

import UIKit

class RaceViewController: UIViewController {

    let raceArray = ["Дворф","Человек","Эльф","Полуэльф","Полуорк"]
    var currentRace: String! {
        didSet {
        selectingImage()
        _ = checkValidation()
    }}
   
    @IBOutlet weak var nameChar: UITextField!
    @IBOutlet weak var ageChar: UITextField!
    @IBOutlet weak var heightChar: UITextField!
    @IBOutlet weak var weightChar: UITextField!
    @IBOutlet weak var additionalLanguage: UITextField!
    var shortInfoView: UIView? {
        didSet { if let view = shortInfoView {
            view.layer.cornerRadius = 15
        }}
    }
    
    @IBOutlet weak var imageRace: UIImageView!
    @IBOutlet weak var racePicker: UIPickerView!
    
    @IBAction func shortInfoAboutRace(_ sender: UIButton) {
        let view = UIView(frame: CGRect(x: 20 , y: self.view.bounds.maxY + 10, width: self.view.bounds.width - 40 , height: 0))
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        racePicker.delegate = self
        racePicker.dataSource = self
        print(currentRace ?? "")
        let swipeGesture = UISwipeGestureRecognizer(target: shortInfoView, action: )
    }
    
}

extension RaceViewController {
    func selectingImage() {
        switch currentRace {
        case "Дворф": imageRace.image = #imageLiteral(resourceName: "Дварф-100")
        default: imageRace.image = #imageLiteral(resourceName: "Image")
        }
    }
    
    func checkValidation() -> Bool {
        var valid = true
        let array = [nameChar, ageChar, heightChar, weightChar, additionalLanguage]
        for textfield in array {
            
            switch true {
            case textfield?.isEqual(nameChar) where textfield?.text == nil: valid = false
            case textfield?.isEqual(nameChar):
                validName(text: textfield!.text!) ? (nameChar.layer.borderWidth = 0) : (wrongTextField(textField: nameChar))
            case textfield?.isEqual(ageChar) where textfield?.text == nil: valid = false
            case textfield?.isEqual(ageChar):
                validName(text: textfield!.text!) ? (ageChar.layer.borderWidth = 0) : (wrongTextField(textField: ageChar))
            case textfield?.isEqual(heightChar) where textfield?.text == nil: valid = false
            case textfield?.isEqual(heightChar):
                validName(text: textfield!.text!) ? (heightChar.layer.borderWidth = 0) : (wrongTextField(textField: heightChar))
            case textfield?.isEqual(weightChar) where textfield?.text == nil: valid = false
            case textfield?.isEqual(weightChar):
                validName(text: textfield!.text!) ? (weightChar.layer.borderWidth = 0) : (wrongTextField(textField: weightChar))
            case textfield?.isEqual(additionalLanguage) where textfield?.text == nil: valid = false
            case textfield?.isEqual(additionalLanguage):
                validName(text: textfield!.text!) ? (additionalLanguage.layer.borderWidth = 0) : (wrongTextField(textField: additionalLanguage))
            default: break
            }
            if textfield!.layer.borderWidth > 0 { valid = false }
        }
        return valid
    }
}

extension RaceViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        raceArray.count
    }
}

extension RaceViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return raceArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentRace = raceArray[row]
    }
}

extension RaceViewController {
    private func validName (text:String) -> Bool {
        guard text.count < 20 else { return false}
        return false
    }
    private func validAge (text:String) -> Bool {
       false
    }
    private func validHeight (text:String) -> Bool {
        false
    }
    private func validWeight (text:String) -> Bool {
        false
    }
    private func validAdditionalLanguage (text:String) -> Bool {
        false
    }

}
