//
//  Extension + UITextField.swift
//  ColorizedApp
//
//  Created by Степан Фоминцев on 11.04.2023.
//

import Foundation
import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(
            frame: CGRect.init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 50
            )
        )
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonAction)
        )
        let items = [space, done]
        
        doneToolbar.items = items
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.endEditing(true)
    }
}
