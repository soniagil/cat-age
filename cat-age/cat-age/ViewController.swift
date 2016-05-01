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
    @IBOutlet weak var txtCatName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtResult: UILabel!
    @IBOutlet weak var imageCat: UIImageView!
    @IBOutlet weak var msgError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btCalculate.layer.cornerRadius = 5
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func calculate(sender: AnyObject) {
        let humanAge = Int(txtAge.text!)
        let catName = txtCatName.text!
        
        if humanAge != nil {
            msgError.text = ""
            
            let catYears = humanAge! * 7
            let images = ["cat_grumpy", "cat_poo", "cat_acrobat", "cat_scared", "cat_sing"]
            let randomNumber = arc4random_uniform(UInt32(images.count))
            let imageName = images[Int(randomNumber)]
            
            imageCat.image = UIImage(named: imageName)
            
            if catName != "" {
                txtResult.text = catName + " is " + String(catYears) + " years old!"
            } else {
                txtResult.text = String(catYears) + " years old!"
            }
            
        } else {
            msgError.text = "Please, complete the age"
        }
        
        dismissKeyboard()
    }

}

