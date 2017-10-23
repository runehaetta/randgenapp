//
//  ViewController.swift
//  RandGenApp
//
//  Created by Rune Haetta on 23/10/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var touchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordLabel.text = "1234567890abcdef"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

