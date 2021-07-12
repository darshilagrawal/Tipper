//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Darshil Agrawal on 05/05/20.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var result = "0.0"
    var tip = 10
    var split = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        UIView.transition(with: sender,
                                  duration: 1,
                                  options: .transitionFlipFromRight,
                                  animations: {
                                    sender.setTitle("Ready Again?", for: .normal)
                                  }, completion: { (finished) -> Void in
                                    self.dismiss(animated: true, completion: nil)
                                })
        
    }
    
   
}
