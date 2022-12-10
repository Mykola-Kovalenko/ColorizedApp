//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Николай Коваленко on 10.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redColourIndex: UILabel!
    @IBOutlet var greenColourIndex: UILabel!
    @IBOutlet var blueColourIndex: UILabel!
    
    @IBOutlet var redColourSlider: UISlider!
    @IBOutlet var blueColourSlider: UISlider!
    @IBOutlet var greenColourSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 30
        setupSlidersLabel()
        setupSlider()
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColourSlider.value),
            green: CGFloat(greenColourSlider.value),
            blue: CGFloat(blueColourSlider.value),
            alpha: CGFloat(1.0)
            )
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBackgroundColour(_ sender: UISlider) {
        redColourIndex.text = String(redColourSlider.value)
        greenColourIndex.text = String(greenColourSlider.value)
        blueColourIndex.text = String(blueColourSlider.value)
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColourSlider.value),
            green: CGFloat(greenColourSlider.value),
            blue: CGFloat(blueColourSlider.value),
            alpha: CGFloat(1.0)
            )
    
    }
    //MARK: private function
    private func setupSlidersLabel() {
        redColourIndex.text = String(format: "%.2F", redColourSlider.value)
        greenColourIndex.text = String(format: "%.2F", greenColourSlider.value)
        blueColourIndex.text = String(format: "%.2F", blueColourSlider.value)
    }
    private func setupSlider() {
        redColourSlider.minimumTrackTintColor = .red
        greenColourSlider.minimumTrackTintColor = .green
        blueColourSlider.minimumTrackTintColor = .blue
    }
    
    
}

