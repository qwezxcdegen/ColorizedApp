//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Степан Фоминцев on 24.03.2023.
//

import UIKit

final class ColorViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK: - Properties
    var redColor: Float!
    var greenColor: Float!
    var blueColor: Float!
    
    var delegate: ColorViewControllerDelegate!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.addDoneButtonOnKeyboard()
        greenTextField.addDoneButtonOnKeyboard()
        blueTextField.addDoneButtonOnKeyboard()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 15
        
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
        
        setColor()
        
        redColorLabel.text = string(from: redSlider)
        greenColorLabel.text = string(from: greenSlider)
        blueColorLabel.text = string(from: blueSlider)
        
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }

    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redColorLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenColorLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueColorLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func donePressed() {
        view.endEditing(true)
        guard let color = colorView.backgroundColor else { return }
        delegate.setColor(color)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - UITextFieldDelegate
extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = Float(textField.text ?? "0.0") else { return }
        if textField == redTextField {
            redSlider.setValue(newValue, animated: true)
            redColorLabel.text = string(from: redSlider)
        } else if textField == greenTextField {
            greenSlider.setValue(newValue, animated: true)
            greenColorLabel.text = string(from: greenSlider)
        } else if textField == blueTextField {
            blueSlider.setValue(newValue, animated: true)
            blueColorLabel.text = string(from: blueSlider)
        }
        setColor()
    }
}
