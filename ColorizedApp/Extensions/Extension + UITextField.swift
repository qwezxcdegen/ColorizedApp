//
//  Extension + UITextField.swift
//  ColorizedApp
//
//  Created by Степан Фоминцев on 11.04.2023.
//

import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonAction)
        )
        
        let items = [space, done]
        keyboardToolbar.sizeToFit()
        keyboardToolbar.items = items
        
        self.inputAccessoryView = keyboardToolbar
    }
    
    @objc func doneButtonAction() {
        self.endEditing(true)
    }
}
