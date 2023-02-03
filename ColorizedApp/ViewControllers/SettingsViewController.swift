//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Николай Коваленко on 10.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redColourIndex: UILabel!
    @IBOutlet var greenColourIndex: UILabel!
    @IBOutlet var blueColourIndex: UILabel!
    
    @IBOutlet var redColourSlider: UISlider!
    @IBOutlet var blueColourSlider: UISlider!
    @IBOutlet var greenColourSlider: UISlider!
    
    @IBOutlet var redLabelTextField: UITextField!
    @IBOutlet var greenLabelTextField: UITextField!
    @IBOutlet var blueLabelTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 30
    
        setupSlidersLabel(for: redColourIndex, greenColourIndex, blueColourIndex)
        setupSlidersText(for: redLabelTextField, greenLabelTextField, blueLabelTextField)
        
        setupSlider()
        setColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
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
    //MARK: private function
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
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


extension SettingsViewController:UITextFieldDelegate {
    
}

//Сделайте текстовые поля, в которых можно задавать значение цвета с цифровой экранной клавиатуры. Свяжите клавиатуру с тулбаром и разместите в нем кнопку Done. По нажтию на кнопку клавиатура должна скрываться. Так же сделайте возможность скрывать клавиатуру тапом по экрану.
//
//Для работы с текстовыми полями подпишите класс под протокол UITextFieldDelegate и реализуйте метод протокола textFieldDidEndEditing(_ textField: UITextField) для передачи вносимых текстовых значений в лейблы и слайдеры. Так же не забудьте инициализировать делегатов для текстовых полей: textField.delegate = self. Это необходимо сделать в методе viewDidLoad.
//
//Значения слайдеров должны передаваться одновременно в лейблы и текстовые поля. Значения, вносимые в текстовые поля должны передаваться одновременно в слайдеры и в лейблы.