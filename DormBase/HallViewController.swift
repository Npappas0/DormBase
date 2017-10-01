//
//  HallViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "Cell"

class HallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var hall = [Room]()
    var statusColor = [UIColor.red, UIColor.green, UIColor.yellow]
    var rooms = [Room]()
    var statusColor = [UIColor.red, UIColor.green, UIColor.yellow]
    
    var refreshControl: UIRefreshControl!
    
    var ref: DatabaseReference
    {
        return Database.database().reference()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        resizeScreen()
        collectionView.reloadData()
        
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(grabRooms), for: UIControlEvents.valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
<<<<<<< HEAD
    func writeComment(newComment:String) -> Void {
        self.ref.child("MSV").child("South").child("2nd Floor").child("201").child("Comments").setValue(newComment)
    }
    
=======
>>>>>>> parent of 1a486e2... Added reading and Changed room class
    @objc func grabRooms()
    {
            {   (snap) in
                if let dict = snap.value as? [String:Any] {
                    }
                }
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
        })
     }
 
    func resizeScreen()
    {
        let screenSize : CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/4, height: 90)
        layout.minimumInteritemSpacing = screenWidth/2
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! RoomCollectionViewCell
        
        cell.cellName.text = ""
        cell.backgroundColor = statusColor[rooms[indexPath.item].getStatus()]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
}
