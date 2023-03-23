//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Степан Фоминцев on 24.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private Outlets
    @IBOutlet weak private var colorView: UIView!
    
    @IBOutlet weak private var redColorLabel: UILabel!
    @IBOutlet weak private var greenColorLabel: UILabel!
    @IBOutlet weak private var blueColorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setRandomColor()
        setColorFromLabels()
    }

    // MARK: - Private IBActions
    @IBAction private func redSliderChanged() {
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        setColorFromLabels()
    }
    
    @IBAction private func greenSliderChanged() {
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        setColorFromLabels()
    }
    
    @IBAction private func blueSliderChanged() {
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        setColorFromLabels()
    }
    
    // MARK: - Private Methods
    private func setColorFromLabels() {
        let redColor = CGFloat(Float(redColorLabel.text!)!)
        let greenColor = CGFloat(Float(greenColorLabel.text!)!)
        let blueColor = CGFloat(Float(blueColorLabel.text!)!)
        
        colorView.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1.0
        )
    }
    
    private func setRandomColor() {
        let red = Float.random(in: 0...1)
        let green = Float.random(in: 0...1)
        let blue = Float.random(in: 0...1)
        
        redColorLabel.text = String(format: "%.2f", red)
        greenColorLabel.text = String(format: "%.2f", green)
        blueColorLabel.text = String(format: "%.2f", blue)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
}

