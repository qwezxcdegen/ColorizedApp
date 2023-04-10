//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Степан Фоминцев on 11.04.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {
            return
        }
        guard let colors = view.backgroundColor?.cgColor.components else {
            return
        }
        colorVC.redColor = Float(colors[0])
        colorVC.greenColor = Float(colors[1])
        colorVC.blueColor = Float(colors[2])
        
        colorVC.delegate = self
    }
    
    @IBAction func changeColorPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "changeColor", sender: nil)
    }
    
}

// MARK: - ColorViewControllerDelegate
extension MainViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
