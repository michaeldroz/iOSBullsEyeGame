//
//  ViewController.swift
//  BullsEye
//
//  Created by Michael Droz on 11/12/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Bull's Eye!",
            message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
    println("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
}


