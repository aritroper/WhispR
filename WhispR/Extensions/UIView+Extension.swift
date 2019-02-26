//
//  UIView+Extension.swift
//  WhispR
//
//  Created by Ari Troper on 10/29/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    /**
     Makes a gradient from two colors.
    **/
    func setGradientBG(startColor: UIColor, endColor: UIColor, vertical:Bool)
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds //set size of layer to object size
        gradientLayer.colors = [endColor.cgColor, startColor.cgColor]
        gradientLayer.locations = [0.0, 1.0] //breakpoint in the gradient; where the colors mix
        if vertical
        {
            //top -> down gradient
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        }
        else
        {
            //left -> right gradient
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        }
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /**
     Makes a blurred acrylic style background.
    **/
    func setAcrylicBG()
    {
        self.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        blurEffectView.layer.shadowColor = UIColor.black.cgColor
        blurEffectView.layer.shadowOpacity = 0.5
        blurEffectView.layer.shadowOffset = CGSize(width: -1, height: 1)
        blurEffectView.layer.shadowRadius = 1
        
        self.addSubview(blurEffectView)
        
        //sends the blur view to back
        blurEffectView.superview?.sendSubviewToBack(blurEffectView)
    }
}
