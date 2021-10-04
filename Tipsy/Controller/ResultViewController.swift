//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Darshil Agrawal on 05/05/20.
//

import UIKit
import Lottie
class ResultViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipAnimation: AnimationView!
    var result = "0.0"
    var tip = 10
    var split = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipAnimation.contentMode = .scaleAspectFit
        tipAnimation.loopMode = .loop
        tipAnimation.animationSpeed = 0.8
        tipAnimation.play()
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
