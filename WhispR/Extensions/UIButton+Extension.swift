//
//  UIButton+Extension.swift
//  WhispR
//
//  Created by Ari Troper on 10/29/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import Foundation
import UIKit

extension UIButton
{
    @IBInspectable var cornerRadius: CGFloat
    {
        get
        {
            return layer.cornerRadius
        }
        set
        {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat
    {
        get
        {
            return layer.borderWidth
        }
        set
        {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor?
    {
        get
        {
            return UIColor(cgColor: layer.borderColor!)
        }
        set
        {
            layer.borderColor = newValue?.cgColor
        }
    }
}
