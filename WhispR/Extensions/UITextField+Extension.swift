//
//  UITextField+Extension.swift
//  WhispR
//
//  Created by Ari Troper on 10/29/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
}
