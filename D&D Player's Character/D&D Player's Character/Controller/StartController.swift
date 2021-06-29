//
//  ViewController.swift
//  D&D Player's Character
//
//  Created by Евгений Полюбин on 02.05.2021.
//

import UIKit

class StartController: UIViewController {

   
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var choseCharButton: UIButton!
    @IBOutlet weak var encyclopediaButton: UIButton! {
        didSet {
            createButton.layer.cornerRadius = 10
            choseCharButton.layer.cornerRadius = 10
            encyclopediaButton.layer.cornerRadius = 10
        }
    }
    
}

