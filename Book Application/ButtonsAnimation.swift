//
//  ButtonsAnimation.swift
//  Book Application
//
//  Created by apple on 2017-10-24.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    //Animation for "Save Book" button
    func flash(){
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.autoreverses = true
        flash.repeatCount = 2
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        layer.add(flash, forKey: nil)
    }
    
    //Animation for "Clear All Books" button
    func shake(){
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        shake.repeatCount = 2
        
        layer.add(shake, forKey: nil)
    }
}
