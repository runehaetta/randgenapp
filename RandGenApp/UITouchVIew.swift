//
//  UITouchVIew.swift
//  RandGenApp
//
//  Created by Rune Haetta on 23/10/2017.
//  Copyright © 2017 Leanyard. All rights reserved.
//

import UIKit

class UITouchView : UIView {

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)

        print("touchesMoved", location)
    }
}
