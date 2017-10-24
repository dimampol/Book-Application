//
//  GradientBackground.swift
//  Book Application
//
//  Created by apple on 2017-10-24.
//  Copyright © 2017 Dmitrii Poliakov. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

