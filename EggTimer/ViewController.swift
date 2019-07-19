//
//  ViewController.swift
//  EggTimer
//
//  Created by Chris Chandler on 7/18/19.
//  Copyright © 2019 Chris Chandler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    var timerValue: Int = 0
    
    let timerDefault: Int = 210
    
    @IBAction func pauseTimer(_ sender: Any) {
        
        timer.invalidate()
    
    }
    
    
    @IBAction func startTime(_ sender: Any) {

        if timerValue > 0 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true)
        } else {
            timerLabel.text = "Please reset time"
        }

    }
    
    @IBAction func resetTime(_ sender: Any) {
        
        timer.invalidate()
        
        timerValue = timerDefault
        
        setTimerLabel()
        
    }

    @IBAction func subtractTime(_ sender: Any) {
        
        if timerValue >= 10 {
            timerValue = timerValue - 10
            setTimerLabel()
        }
    }
    
    @IBAction func addTime(_ sender: Any) {
        
        timerValue = timerValue + 10
        setTimerLabel()

    }
    
    @objc func countdown() {
    
        if timerValue >= 1 {
            timerValue = timerValue - 1
            setTimerLabel()
        } else {
            timer.invalidate()
            timerLabel.text = "Time's Up!"
        }
    
    }
    
    func setTimerLabel() {
        
        timerLabel.text = String(timerValue)
    
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timerValue = timerDefault
        setTimerLabel()
        
    }


}

