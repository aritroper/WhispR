//
//  PostCell.swift
//  WhispR
//
//  Created by Ari Troper on 10/30/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit

protocol PostDelegate: AnyObject { func postTapped(cell: PostCell) }

class PostCell: UICollectionViewCell
{
    @IBOutlet weak var spotsFilled: UILabel!
    @IBOutlet weak var friendsGoing: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var host: UILabel!
    @IBOutlet weak var eventTypeIcon: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bg: UIView!
    weak var delegate: PostDelegate?
    var index = 0
    var startColor: UIColor!
    var endColor: UIColor!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.postTapped))
        self.addGestureRecognizer(tapRecognizer)
        
        DispatchQueue.main.async
        {
            if (self.index + 1) % 2 == 0
            {
                self.startColor = UIColor("#3FCBB2")
                self.endColor = UIColor("#6DBFD7")
                self.bg.setGradientBG(startColor: self.startColor, endColor: self.endColor, vertical: true)
            }
            else
            {
                if (self.index + 1) % 3 == 0
                {
                    self.startColor = UIColor("#803FCB")
                    self.endColor = UIColor("#6DC3D7")
                    self.bg.setGradientBG(startColor: self.startColor, endColor: self.endColor, vertical: true)
                }
                else
                {
                    self.startColor = UIColor("#3F6DCB")
                    self.endColor = UIColor("#6DD7C8")
                    self.bg.setGradientBG(startColor: self.startColor, endColor: self.endColor, vertical: true)
                }
            }
        }
    }
    
    func transition()
    {
        //instantiate view and grow
    }
    
    @objc func postTapped()
    {
        delegate?.postTapped(cell: self)
    }
}

