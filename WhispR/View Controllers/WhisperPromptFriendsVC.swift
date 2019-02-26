//
//  WhisperPromptFriendsVC.swift
//  WhispR
//
//  Created by Ari Troper on 10/31/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit
import Canvas

class WhisperPromptFriendsVC: UIViewController
{
    @IBOutlet weak var acrylicBg: UIView!
    @IBOutlet weak var whisperInput: TextField!
    @IBOutlet weak var whisperPromptView: CSAnimationView!
    
    @IBOutlet weak var WKCollection: UICollectionView!
    
    var cellWidth: CGFloat = 0
    var post: PostCell!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        whisperInput.becomeFirstResponder()
        acrylicBg.setAcrylicBG()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "sgPost"
        {
            let recieverVC = segue.destination as! PostVC
            recieverVC.post = post
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        whisperPromptView.startCanvasAnimation()
    }
    
    func showAnimate()
    {
        self.view.alpha = 0
        UIView.animate(withDuration: 0.5, animations:
        { self.view.alpha = 1 })
    }
    
    func hideAnimate()
    {
        UIView.animate(withDuration: 0.25, animations:
        { self.view.alpha = 0 }, completion:{(finished : Bool) in
            if finished { self.view.removeFromSuperview() } })
    }
    
    @IBAction func close(_ sender: Any)
    {
        hideAnimate()
    }

    /**
     Checks whisper.
    **/
    @IBAction func submit(_ sender: Any)
    {
        // TODO
    }
}

extension WhisperPromptFriendsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //first number should be replaced by numberOfGuests
        return min(2, 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WKCell", for: indexPath) as! WKCell
        if indexPath.row == 3 //&& numGuests > 4
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WKCellMore", for: indexPath) as! WKCell
            cell.unknownUsersCount.text = "+ " //+ numberOfGuests - 3
        }
        
        cellWidth = cell.layer.frame.size.width
        //reload layout
        collectionView.collectionViewLayout.invalidateLayout()
        //cell.userPicture.image = set image here
        return cell
    }
    
    /**
     Center cells.
    **/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let totalCellWidth = Int(cellWidth) * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
