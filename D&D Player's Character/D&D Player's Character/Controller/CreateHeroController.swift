//
//  CreateHeroController.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 26.06.2021.
//

import UIKit

class CreateHeroController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
public func wrongTextField(textField: UITextField) {
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
