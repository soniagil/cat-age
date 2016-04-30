//
//  ViewController.swift
//  cat-age
//
//  Created by Sonia Gil Benítez on 30/4/16.
//  Copyright © 2016 Sonia Gil Benítez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btCalculate: UIButton!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtResult: UILabel!
    @IBOutlet weak var imageCat: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btCalculate.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: AnyObject) {
        let humanAge = Int(txtAge.text!)
        if humanAge != nil {
            let catYears = humanAge! * 7
            
            let images = ["cat_grumpy", "cat_poo", "cat_acrobat", "cat_scared", "cat_sing"]
            
            let randomNumber = arc4random_uniform(UInt32(images.count))
            
            let imageName = images[Int(randomNumber)]
            
            imageCat.image = UIImage(named: imageName)
            
            txtResult.text = String(catYears) + " años!"
        } else {
            txtResult.text = "Por favor, introduzca la edad"
        }
    }

}

