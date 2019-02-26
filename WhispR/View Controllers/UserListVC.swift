//
//  UserListVC.swift
//  WhispR
//
//  Created by Ari Troper on 11/4/18.
//  Copyright © 2018 Ari Troper. All rights reserved.
//

import UIKit

class UserListVC: UIViewController
{
    @IBOutlet var acrylicBG: UIView!
    @IBOutlet weak var guestList: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        acrylicBG.setAcrylicBG()
    }
    
    @IBAction func close(_ sender: Any)
    {
        self.hideAnimate()
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
}

extension UserListVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uCell", for: indexPath)
        return cell
    }
}
