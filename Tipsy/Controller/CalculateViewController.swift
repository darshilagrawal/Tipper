
import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.10
    var numberOfPeople = 1
    var billTotal = 0.0
    var resultTo2DecimalPlaces = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text="0"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
               
               
               numberOfPeople = Int(sender.value)
        
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
           tenPctButton.isSelected = false
           twentyPctButton.isSelected = false
           sender.isSelected = true
           
           let buttonTitle = sender.currentTitle!
           let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
           let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
           tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        
        if bill != "" {
            
            
            billTotal = Double(bill)!
            
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            
            resultTo2DecimalPlaces = String(format: "%.2f", result)
        }
        
        UIView.transition(with: sender,
                                  duration: 1,
                                  options: .transitionFlipFromLeft,
                                  animations: {
                                    sender.setTitle("Here You Go", for: .normal)
                                  }, completion: { (finished) -> Void in
                                    self.performSegue(withIdentifier:"calculateButtonPressed",sender: self)
                                })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateButtonPressed"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.result = resultTo2DecimalPlaces
            resultVC.split = numberOfPeople
            resultVC.tip = Int(tip * 100)
            
        }
        
    }
}
