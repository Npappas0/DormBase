//
//  HallViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class HallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var rooms = [Room]()
    var statusColor = [UIColor.gray, UIColor.green, UIColor.yellow, UIColor.red]
    
    var authEmail = ""
    var authPass = ""
    
    var refreshControl: UIRefreshControl!
    
    var ref: DatabaseReference
    {
        return Database.database().reference()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        resizeScreen()
        collectionView.reloadData()
        
        grabRooms(dorm: "MSV", hall: "South", floor: "2nd Floor")
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(grabRooms), for: UIControlEvents.valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    @objc func grabRooms(dorm : String, hall : String, floor : String)
    {
        rooms.removeAll()
        ref.child(dorm).child(hall).child(floor).child("Room").observeSingleEvent(of: .value, with:
            {   (snap) in
                if let dict = snap.value as? [String:Any] {
                    for roomNum in dict.keys {
                        if let roomValues = dict[roomNum] as? [String:Any] {
                            self.rooms.append(Room(roomNo: roomNum, dict: roomValues))
                       }
                    }
                }
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
        })
     }
    
    func writeComment(newComment: String) -> Void {
        self.ref.child("MSV").child("South").child("2nd Floor").child("Room").child("201").child("Comments").setValue(newComment)
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
        return rooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! RoomCollectionViewCell
        
        cell.cellName.text = rooms[indexPath.item].getRoomNo()
        cell.backgroundColor = statusColor[rooms[indexPath.item].getStatus()]
        
        return cell
    }
    
    func doesEmailAndPasswordMatch(Email: String,Password: String) -> Bool {
        if((Email == authEmail) && (Password == authPass)){
                return true
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        goToView(withID: "DViewController", handler:
            {   (vc) in
                if let nextVC = vc as? DetailViewController
                {
                    nextVC.room = self.rooms[indexPath.item]
                }
        })
    }
    
    func goToView(withID identifier: String, handler: ((UIViewController) -> Void)?)
    {
        if let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        {
            if handler != nil {handler!(vc)}
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
