//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Николай Коваленко on 10.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var mainView: UIView! {
        didSet{
            mainView.layer.cornerRadius = 30
        }
    }
    
    @IBOutlet var redColourIndex: UILabel!
    @IBOutlet var greenColourIndex: UILabel!
    @IBOutlet var blueColourIndex: UILabel!
    
    @IBOutlet var redColourSlider: UISlider!
    @IBOutlet var blueColourSlider: UISlider!
    @IBOutlet var greenColourSlider: UISlider!
    
    @IBOutlet var redLabelTextField: UITextField!
    @IBOutlet var greenLabelTextField: UITextField!
    @IBOutlet var blueLabelTextField: UITextField!
    
    var delegate: SettingsViewControllerDelagate!
    var backgroundColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        setColor()
        
        setupSlidersLabel(for: redColourIndex, greenColourIndex, blueColourIndex)
        setupSlidersText(for: redLabelTextField, greenLabelTextField, blueLabelTextField)
        
        redLabelTextField.delegate = self
        greenLabelTextField.delegate = self
        blueLabelTextField.delegate = self
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func changeBackgroundColour(_ sender: UISlider) {
        switch sender {
        case redColourSlider:
            setupSlidersLabel(for: redColourIndex)
            setupSlidersText(for: redLabelTextField)
        case greenColourSlider:
            setupSlidersLabel(for: greenColourIndex)
            setupSlidersText(for: greenLabelTextField)
        default:
            setupSlidersLabel(for: blueColourIndex)
            setupSlidersText(for: blueLabelTextField)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(mainView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: private function
    private func setupSlidersLabel(for _: UILabel...) {
        redColourIndex.text = String(format: "%.2F", redColourSlider.value)
        greenColourIndex.text = String(format: "%.2F", greenColourSlider.value)
        blueColourIndex.text = String(format: "%.2F", blueColourSlider.value)
    }
    
    private func setupSlidersText(for _: UITextField...) {
        redLabelTextField.text = String(format: "%.2F", redColourSlider.value)
        greenLabelTextField.text = String(format: "%.2F", greenColourSlider.value)
        blueLabelTextField.text = String(format: "%.2F", blueColourSlider.value)
    }
    
    private func setupSlider() {
        redColourSlider.minimumTrackTintColor = .red
        greenColourSlider.minimumTrackTintColor = .green
        blueColourSlider.minimumTrackTintColor = .blue
    }
    
    private func setColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColourSlider.value),
            green: CGFloat(greenColourSlider.value),
            blue: CGFloat(blueColourSlider.value),
            alpha: CGFloat(1.0)
        )
    }

}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        switch textField {
        case redLabelTextField:
            redColourSlider.setValue(numberValue , animated: true)
            setupSlidersLabel(for: redColourIndex)
            setupSlidersText(for: redLabelTextField)
        case greenLabelTextField:
            greenColourSlider.setValue(numberValue, animated: true)
            setupSlidersLabel(for: greenColourIndex)
            setupSlidersText(for: greenLabelTextField)
        default:
            blueColourSlider.setValue(numberValue, animated: true)
            setupSlidersLabel(for: blueColourIndex)
            setupSlidersText(for: blueLabelTextField)
        }
        setColor()
        return
    }
}
