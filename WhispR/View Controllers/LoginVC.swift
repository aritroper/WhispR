//
//  ViewController.swift
//  WhispR
//
//  Created by Ari Troper on 10/29/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class LoginVC: UIViewController
{
    @IBOutlet var gradientBg: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //set up the gradient
        gradientBg.setGradientBG(startColor: UIColor("#3FCBB2"), endColor: UIColor("#6DBFD7"), vertical: true)
    }


}

