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
    @IBOutlet weak var regeneratePassword: UIButton!
    let lowerCase: String = "abcdefghijklmnopqrstuvwxyz"
    let upperCase: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let numbers: String = "0123456789"
    let symbols: String = "~!@#$%^&*()-+{}[]<>,.?"
    var password: String = ""
    var passwordLength: Int = 15

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func maxLength(_ sender: UISlider) {
        let value: Int = Int(lengthSlider.value)
        lengthField.text = String(value)
        passwordLength = Int(lengthSlider.value)
    }

    @IBAction func generatePassword(_ sender: UIButton) {
        passwordText.isUserInteractionEnabled = true
        tapToCopy.text = "[ tap password to copy ]".uppercased()
        let characters: String = randomizer()
        let shuffledChars = (0..<passwordLength).map{_ in characters.randomElement()!}
        if (confirm(shuffledChars: String(shuffledChars))) {
            password = String(shuffledChars)
            passwordText.text = password
        } else {
            generatePassword(regeneratePassword)
        }
    }
    
    func randomizer() -> String {
        var characters: String = ""
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
    
    func confirm(shuffledChars: String) -> Bool {
        var goodPassword: Bool = true
        if (lowerCaseSwitch.isOn) {
            goodPassword =
                (shuffledChars.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil) ? true : false
        }
        if (upperCaseSwitch.isOn) {
            goodPassword =
                (shuffledChars.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil) ? true : false
        }
        if (numberSwitch.isOn) {
            goodPassword =
                (shuffledChars.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil) ? true : false
        }
        if (symbolSwitch.isOn) {
            goodPassword =
                (shuffledChars.rangeOfCharacter(from: CharacterSet.symbols) != nil) ? true : false
        }
        return goodPassword
    }
    
    @IBAction func lowerCaseChange(_ sender: UISwitch) {
        if (upperCaseSwitch.isOn == false &&
            symbolSwitch.isOn == false &&
            numberSwitch.isOn == false) {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func upperCaseChange(_ sender: UISwitch) {
        if (symbolSwitch.isOn == false &&
            lowerCaseSwitch.isOn == false &&
            numberSwitch.isOn == false) {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func numbersChange(_ sender: UISwitch) {
        if (upperCaseSwitch.isOn == false &&
            lowerCaseSwitch.isOn == false &&
            symbolSwitch.isOn == false) {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func symbolsChange(_ sender: UISwitch) {
        if (upperCaseSwitch.isOn == false &&
            lowerCaseSwitch.isOn == false &&
            numberSwitch.isOn == false) {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func copyText(_ sender: UITextField) {
        passwordText.isUserInteractionEnabled = false
        if (password.count > 0) {
            UIPasteboard.general.string = password
            tapToCopy.text = "[ password copied ]".uppercased()
        }
    }
}
