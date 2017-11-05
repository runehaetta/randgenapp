//
//  ViewController.swift
//  RandGenApp
//
//  Created by Rune Haetta on 23/10/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITouchViewDelegate {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var touchView: UITouchView!
    
    let randomStringGenerator = RandomStringGenerator()
    
    let pointFifo = FixedFifo(12)
    
    let sampleRate = 10
    var touchCount = 0
    
    func touchesMoved(_ location: CGPoint) {

        if self.touchCount == 0  {
            let pointSum = Int(location.x + location.y)
            self.pointFifo.append(pointSum)
            
            let passwordText = self.randomStringGenerator.nextString(numbers: self.pointFifo.buffer)
            self.passwordLabel.text = passwordText
        }
        self.touchCount = (self.touchCount + 1) % self.sampleRate
    }
    
    @IBAction func clearButton(_ sender: Any) {
        clearPassword()
    }

    func clearPassword() {
        self.pointFifo.clear()
        self.passwordLabel.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.touchView.touchViewDelegate = self

        clearPassword()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

