//
//  HomeVC.swift
//  WhispR
//
//  Created by Ari Troper on 10/29/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class HomeVC: UIViewController
{
    @IBOutlet weak var school: UILabel!
    @IBOutlet weak var schoolGradient: UIView!
    @IBOutlet weak var posts: UICollectionView!
    var widthConst: CGFloat! = 1.3
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        school.adjustsFontSizeToFitWidth = true
        schoolGradient.setGradientBG(startColor: UIColor("#CD5069"), endColor: UIColor("#865CD4"), vertical: false)
        schoolGradient.mask = school
    }
    
    override func viewDidLayoutSubviews()
    {
        //run post configuration after auto-layout to resize
        posts.register(UINib.init(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
        let postCarousel = UPCarouselFlowLayout()
        postCarousel.itemSize = CGSize(width: UIScreen.main.bounds.size.width/widthConst, height: posts.frame.size.height)
        postCarousel.scrollDirection = .horizontal
        postCarousel.sideItemScale = 0.8
        postCarousel.sideItemAlpha = 1.0
        postCarousel.spacingMode = .fixed(spacing: 25)
        posts.collectionViewLayout = postCarousel
    }
    
    @IBAction func didTapButton(_ sender: UIButton)
    {
        for button in self.view.subviews as [UIView]
        {
            if button is UIButton
            {
                //Toggle buton
                button.alpha = button.tag == sender.tag ? 1.0 : 0.5
            }
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = posts.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension HomeVC: PostDelegate
{
    /**
     Prompt whisper if whisper event, if not segue to event.
    **/
    func postTapped(cell: PostCell)
    {
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbWhisperPromptFriends") as! WhisperPromptFriendsVC
        
        self.addChild(popupVC)
        self.view.addSubview(popupVC.view)
        
        popupVC.view.frame = self.view.frame
        popupVC.post = cell
        popupVC.didMove(toParent: self)
        popupVC.showAnimate()
    }
}

