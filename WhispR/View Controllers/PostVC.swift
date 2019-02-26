//
//  PostVC.swift
//  WhispR
//
//  Created by Ari Troper on 11/1/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class PostVC: UIViewController
{

    @IBOutlet weak var infoCollection: UICollectionView!
    @IBOutlet var gradientBg: UIView!
    var post: PostCell!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        gradientBg.setGradientBG(startColor: post.startColor, endColor: post.endColor, vertical: true)
    }
    
    override func viewDidLayoutSubviews()
    {
        //run post configuration after auto-layout to resize
        infoCollection.register(UINib.init(nibName: "DetailCell", bundle: nil), forCellWithReuseIdentifier: "DetailCell")
        let postCarousel = UPCarouselFlowLayout()
        postCarousel.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: infoCollection.frame.size.height)
        postCarousel.scrollDirection = .horizontal
        postCarousel.sideItemScale = 0.8
        postCarousel.sideItemAlpha = 1.0
        postCarousel.spacingMode = .fixed(spacing: 25)
        infoCollection.collectionViewLayout = postCarousel
    }
    
    @IBAction func showGuestsTapped(_ sender: Any)
    {
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbUserList") as! UserListVC
        
        self.addChild(popupVC)
        self.view.addSubview(popupVC.view)
        
        popupVC.view.frame = self.view.frame
        popupVC.didMove(toParent: self)
        popupVC.showAnimate()
    }
}

extension PostVC: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCell
        return cell
    }
    
    
}
