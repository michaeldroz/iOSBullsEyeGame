//
//  ViewController.swift
//  BullsEye
//
//  Created by Michael Droz on 11/12/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    var targetValue = 0
    
    var score = 0
    
    var round = 1
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "small_twit")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "small_twit")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable =
            trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)}
        
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert() {
            let difference = abs(targetValue - currentValue)
            let points = 100 - difference
        
            score += points
        
            round += 1
        
        if points == 100 {
            let message = "BULL'S EYE!!!"
            
            let alert = UIAlertController(title: "Droz Game",
                message: message, preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()
                self.updateLabels()})
            
            alert.addAction(action)
            
            presentViewController(alert, animated: true, completion: nil)
            
            //startNewRound()
            //updateLabels()
            
        } else {
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Droz Game",
            message: message, preferredStyle: .Alert)
        
            let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()
                self.updateLabels()})
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        //startNewRound()
        //updateLabels()
            
        }
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
    println("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func startOver(){
        
        println("I am inside startOver()")
    
    currentValue = 0
    
     targetValue = 1 + Int(arc4random_uniform(100))
    
    score = 0
    
    round = 1
        
         updateLabels()

    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}


