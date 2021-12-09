

import UIKit

class InfoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var inchesField: UITextField!

    @IBOutlet weak var genderPicker: UIPickerView!
    
    @IBOutlet weak var exercisePicker: UIPickerView!
    
    var pickGender = "Male"
    let gender = ["Male", "Female"]
    
    var pickActivity = "No exercise"
    let activity = ["No exercise", "Light exercise", "Moderate exercise", "Hard exercise"]
    

    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personal Info"
        
        nameField.delegate = self
        weightField.delegate = self
        inchesField.delegate = self
        heightField.delegate = self
        ageField.delegate = self
        
        genderPicker.tag = 1
        exercisePicker.tag = 2
    }
    
    //Picker view for gender and activity
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return gender[row]
        }
        else{
            return activity[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return gender.count
        }
        else{
            return activity.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
        pickGender = gender[row]
        }
        else{
            pickActivity = activity[row]
        }
        
    }
    

    @IBAction func enterVal(_ sender: Any) {
        if(nameField.text! == "" || weightField.text! == "" || heightField.text! == "" || inchesField.text! == "" || ageField.text! == "")
        {
            
            return textView.text = "PLEASE FILL IN ALL THE INFORMATION"
        }
        let pounds = Double(weightField.text!)
        let kilo = pounds! / 2.2
        let ft = Double(heightField.text!)
        let ftToInch = ft! * 12
        let inch = Double(inchesField.text!)
        let inches = (ftToInch + inch!)
        let meter = (inches) * 0.0254
        let age = Double(ageField.text!)
        
        let cM1 = pounds! * 6.3
        let cM2 = inches * 12.9
        let cM3 = age! * 6.8
        let cM4 = cM1 + cM2 + cM3
        
        let cF1 = pounds! * 4.3
        let cF2 = inches * 4.7
        let cF3 = age! * 6.8
        let cF4 = cF1 + cF2 + cF3
        
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
        
        
        var calories = 0.0
        var x = 1
        var totalCal = 0.0
        switch pickGender {
        case "Male":
            x = 1
        case "Female":
            x = 2
        default:
            x = 1
        }
        
        
        if (x == 1){
            calories = 66 + cM4
        }
        else{
            calories = 655 + cF4
        }
       
        var y = 1
            switch pickActivity {
            case "No exercise":
                y = 1
            case "Light exercise":
                y = 2
            case "Moderate exercise":
                y = 3
            case "Hard exercise":
                y = 4
            default:
                y = 1
            }
        if( y == 1){
            totalCal = Double(round(calories * 1.2))
        }
        else if( y == 2){
            totalCal = Double(round(calories * 1.375))
        }
        else if( y == 3){
            totalCal = Double(round(calories * 1.55))
        }
        else {
            totalCal = Double(round(calories * 1.725))
        }
       
        
        
        textView.text = "Hello, \(nameField.text!)!\nYour BMI is \(BMI), this means \(yourBMI).\nYour recommended calories is \(totalCal) per day to maintain your weight. Inorder to lose weight you have to burn more than you consume. Inorder to gain you have to gain more calories from protein, so you can build muscle.\nReady to start your journey?\nThe best way to start your journey is to start the first step."
                

        
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
