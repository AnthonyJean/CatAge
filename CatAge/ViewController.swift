//
//  ViewController.swift
//  CatAge
//
//  Created by Anthony Jean on 24/01/2019.
//  Copyright © 2019 Anthony Jean. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func calculateAction(_ sender: Any) {
        // When button Calculer is tapped
        
        // Hide Keyboard
        view.endEditing(true)
        
        // Check if input is correct and make it cat age
        if ageTextField.text != nil {
            let text = ageTextField.text!
            if let intValue = Int(text) {
                if (intValue < 0 || intValue > 199) {
                    resultLabel.text = "Votre âge n'est pas valide :("
                } else {
                    let catAge = intValue * 7
                    resultLabel.text = "Votre âge de chat est de \(catAge) ans."
                }
            }
        }
    }
    @IBAction func soundAction(_ sender: Any) {
        // When button Music is tapped
        
        if let text = resultLabel.text {
            let speech = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: text)
            utterance.rate = 0.5
            utterance.voice = AVSpeechSynthesisVoice(language: "fr_FR")
            speech.speak(utterance)
        }
    }
    
}

