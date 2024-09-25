//
//  ViewController.swift
//  homework5
//
//  Created by Oya Selmin Özcan on 24.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelIslem: UILabel!
    @IBOutlet weak var tfSonuc: UITextField!
    @IBOutlet weak var labelSil: UIButton!
    @IBOutlet weak var labelEsit: UIButton!
    @IBOutlet weak var labelArti: UIButton!
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var label6: UIButton!
    @IBOutlet weak var label5: UIButton!
    @IBOutlet weak var label4: UIButton!
    @IBOutlet weak var label9: UIButton!
    @IBOutlet weak var label8: UIButton!
    @IBOutlet weak var label7: UIButton!
    @IBOutlet weak var label1: UIButton!
    @IBOutlet weak var label2: UIButton!
    @IBOutlet weak var label3: UIButton!
    
    @IBOutlet weak var label0: UIButton!
    
    
    var isGradientAdded: Bool = false
    var currentInput: String = ""
    var result: Int = 0
    var currentOperation: String?
    var operationHistory: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelIslem.text = ""
        labelSonuc.text = "İşlem yapınız"
        tfSonuc.text = "    "
        label0.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label4.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label5.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label6.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label7.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label8.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        label9.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        
        let buttons = [label0, label1, label2, label3, label4, label5, label6, label7, label8, label9]
        applyCustomStyle(to: buttons)
        applyRoundedStyle(button: labelSil)
        applyRoundedStyle(button: labelArti)
        
    }
    func applyRoundedStyle(button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
    }
    
    
    
    func applyCustomStyle(to buttons: [UIButton?]) {
        for button in buttons {
            button?.layer.cornerRadius = 15.0
            button?.layer.shadowColor = UIColor.black.cgColor
            button?.layer.shadowOpacity = 0.25
            button?.layer.shadowOffset = CGSize(width: 2, height: 2)
            button?.layer.shadowRadius = 4
            button?.layer.masksToBounds = false
        }
    }
    
    @IBAction func butonSil(_ sender: Any) {
           currentInput = ""
           result = 0
           operationHistory = ""
           labelIslem.text = ""
           labelSonuc.text = "0"
           currentOperation = nil
       }
       
       @IBAction func butonArti(_ sender: Any) {
           if let inputValue = Int(currentInput) {
               if currentOperation == "+" {
                   result += inputValue
               } else {
                   result = inputValue
               }

               operationHistory += "\(currentInput) + "
               labelIslem.text = operationHistory
               currentInput = ""
               currentOperation = "+"
               labelSonuc.text = "\(result)"
           } else {
               labelSonuc.text = "Geçersiz giriş"
           }
       }

       @IBAction func butonEsit(_ sender: Any) {
           if let inputValue = Int(currentInput) {
               switch currentOperation {
               case "+":
                   result += inputValue
               default:
                   break
               }
               operationHistory += "\(currentInput)"
               labelIslem.text = operationHistory
               labelSonuc.text = "\(result)"
               currentInput = ""
               currentOperation = nil
           } else {
               labelSonuc.text = "Geçersiz giriş"
           }
       }

       @IBAction func numberPressed(_ sender: UIButton) {
           if let numberTitle = sender.titleLabel?.text {
               currentInput += numberTitle
               labelIslem.text = operationHistory + currentInput 
           }
       }
   }
