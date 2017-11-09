//
//  MoveViewController.swift
//  RandGenApp
//
//  Created by Rune Haetta on 07/11/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit
import Foundation
import CoreMotion

class MoveViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UILabel!
        
    var timer : Timer!
    
    let motion = CMMotionManager()
    
    let moveFifo = FixedFifo(12)
    let randomStringGenerator = RandomStringGenerator()
    
    @IBAction func startAction(_ sender: Any) {
        startMotion()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        self.timer.invalidate()
    }
    
    @IBAction func clearAction(_ sender: Any) {
        clearPassword()
    }
    
    func startMotion() {
        if self.motion.isDeviceMotionAvailable {
            
            self.motion.deviceMotionUpdateInterval = 0.25
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
            
            self.timer = Timer(fire: Date(), interval: (0.25), repeats: true, block: { (timer) in
                                
                if let data = self.motion.deviceMotion {
                    
                    let attitude = (data.attitude.pitch, data.attitude.roll, data.attitude.yaw)

                    for bp in [ attitude.0.bitPattern, attitude.1.bitPattern, attitude.2.bitPattern ] {
                        self.moveFifo.append(Int(truncatingIfNeeded: bp))
                    }
                    
                    let passwordText = self.randomStringGenerator.nextString(numbers: self.moveFifo.buffer)
                    self.passwordLabel.text = passwordText
                    
                }
            })
            
            RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
        }
    }
    
    func clearPassword() {
        self.moveFifo.clear()
        self.passwordLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearPassword()
    }
}
