//
//  ViewController.swift
//  tweeTextField_tutorial
//
//  Created by Jeff Jeong on 2020/10/29.
//

import UIKit
import TweeTextField

class ViewController: UIViewController {

    @IBOutlet var myEmailTextField: TweeAttributedTextField!
    @IBOutlet var myPasswordTextField: TweeAttributedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        myEmailTextField.placeholder =
        myEmailTextField.tweePlaceholder = "이메일을 입력해 주세요"
        myEmailTextField.placeholderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        myEmailTextField.placeholderDuration = 0.1
        myEmailTextField.minimizationAnimationType = .smoothly
        myEmailTextField.infoAnimationDuration = 0.2
        myEmailTextField.minimumPlaceholderFontSize = 16
        myEmailTextField.originalPlaceholderFontSize = 20
        
    }

    // 비밀번호 글자 입력이 시작될 때
    @IBAction func passwordBeginEditing(_ sender: TweeAttributedTextField) {
        
    }
    
    // 비밀번호 글자가 입력중 일 때
    @IBAction func passwordWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.activeLineColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                sender.hideInfo(animated: true)
            } else if userInput.count < 3 {
                sender.infoTextColor = .red
                sender.activeLineColor = .red
                
                sender.showInfo("3글자 이상 입력하세요!", animated: true)
            } else {
                sender.infoTextColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                sender.showInfo("잘 하셨습니다!", animated: true)
            }
        }
    }
    @IBAction func passwordEndEditing(_ sender: TweeAttributedTextField) {
    }
    
    @IBAction func myEmailWhileEditing(_ sender: TweeAttributedTextField) {
        
        
        
        if let userInput = sender.text {
            
            if userInput.count == 0 {
                sender.activeLineColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                sender.hideInfo(animated: true)
                return
            }
            
            if userInput.isValidEmail == true {
                sender.infoTextColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                sender.activeLineColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                sender.showInfo("이메일 형식 입니다!", animated: true)
            } else {
                sender.infoTextColor = .red
                sender.activeLineColor = .red
                
                sender.showInfo("이메일 형식이 아닙니다!", animated: true)
            }
        }
        
    }
}

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
