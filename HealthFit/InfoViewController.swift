//
//  InfoViewController.swift
//  HealthFit
//
//  Created by Ryan Eng on 12/6/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
  @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var inchesField: UITextField!
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personal Info"
        
        nameField.delegate = self
        weightField.delegate = self
        inchesField.delegate = self
        heightField.delegate = self
        ageField.delegate = self
        

    }
    

    @IBAction func enterVal(_ sender: Any) {
        let pounds = Double(weightField.text!)
        let kilo = pounds! / 2.2
        let ft = Double(heightField.text!)
        let ftToInch = ft! * 12
        let inch = Double(inchesField.text!)
        let meter = (ftToInch + inch!) * 0.0254
        
        let BMI = Double(round((kilo / (meter * meter)) * 100) / 100 )
        var yourBMI = " "
        if (BMI < 18.5){
            yourBMI = "Under Weight"
        }
        else if(BMI > 18.49 && BMI<25){
            yourBMI = "Normal Weight"
        }
        else if(BMI > 24.99 && BMI<30){
            yourBMI = "Over Weight"
        }
        else {
            yourBMI = "Obesity"
        }
        
        let age = Double(ageField.text!)
        
        
        textView.text = "Hello, \(nameField.text!)!\nYour BMI is \(BMI), this means \(yourBMI).\nReady to start your journey?\nThe best way to start your journey is to start the first step."
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightField.resignFirstResponder()
        inchesField.resignFirstResponder()
        heightField.resignFirstResponder()
        ageField.resignFirstResponder()
    }

}
extension InfoViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
