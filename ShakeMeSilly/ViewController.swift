//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Jaime Jazareno III on 29/12/2017.
//  Copyright © 2017 Jaime Jazareno III. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var countInt = 10
    var scoreInt = 0
    var imageInt = 1
    var modeInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func becomeFirstResponder() -> Bool {
//        return true
//    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if modeInt == 1 {
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                
                if imageInt == 5{
                    imageInt = 1
                }
                imageView.image = UIImage(named: "Maracas\(imageInt)")
            }
            
        }
    }
    @IBAction func startGame(_ sender: Any) {
        if countInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCount), userInfo: nil, repeats: true)
            modeInt = 1
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
            
        }
        else if countInt == 0 {
            imageView.image = UIImage(named: "Maracas1")
            countInt = 10
            timeLabel.text = String(countInt)
            scoreInt = 0
            scoreLabel.text = String(scoreInt)
            startGameButton.setTitle("START GAME", for: UIControlState.normal)
        }
    }
    
    @objc func startCount(){
        countInt -= 1
        timeLabel.text = String(countInt)
        
        if countInt == 0 {
            timer.invalidate()
            modeInt = 0
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            startGameButton.setTitle("RESTART GAME", for: UIControlState.normal)
        }
    }
    

}

