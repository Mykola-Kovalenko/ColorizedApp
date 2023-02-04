//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Николай Коваленко on 03.02.2023.
//

import UIKit

protocol SettingsViewControllerDelagate {
    func setColor(_ color: UIColor )
}


class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.backgroundColor = view.backgroundColor
        
    }
}

// MARK: - SettingsViewControllerDelagate
extension MainViewController: SettingsViewControllerDelagate {
    func setColor(_ color: UIColor) {
       view.backgroundColor = color
    }
    
    
    
}
