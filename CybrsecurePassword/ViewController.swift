//
//  ViewController.swift
//  CybrsecurePassword
//
//  Created by Mykel Agathos on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lowerCaseSwitch: UISwitch!
    @IBOutlet weak var upperCaseSwitch: UISwitch!
    @IBOutlet weak var numberSwitch: UISwitch!
    @IBOutlet weak var symbolSwitch: UISwitch!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var lengthField: UILabel!
    @IBOutlet weak var lengthSlider: UISlider!    
    @IBOutlet weak var tapToCopy: UILabel!
    let lowerCase = "abcdefghijklmnopqrstuvwxyz"
    let upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let numbers = "0123456789"
    let symbols = "!@#$%^&*_"
    var password = ""
    var passwordLength = 15

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func maxLength(_ sender: UISlider) {
        let value = Int(lengthSlider.value)
        lengthField.text = String(value)
        passwordLength = Int(lengthSlider.value)
    }

    @IBAction func generatePassword(_ sender: UIButton) {
        tapToCopy.text = "tap password to copy"
        let characters = randomizer()
        let shuffledChars = (0..<passwordLength).map{_ in characters.randomElement()!}
        password = String(shuffledChars)
        passwordText.text = password
    }
    
    func randomizer() -> String {
        var characters = ""
        if (lowerCaseSwitch.isOn) {
            characters += lowerCase
        }
        if (upperCaseSwitch.isOn) {
            characters += upperCase
        }
        if (numberSwitch.isOn) {
            characters += numbers
        }
        if (symbolSwitch.isOn) {
            characters += symbols
        }
        return characters
    }
    

    @IBAction func copyText(_ sender: UITextField) {
        UIPasteboard.general.string = password
        tapToCopy.text = "password copied!"
    }
}
