//
//  HallViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit
//import Firebase

private let reuseIdentifier = "Cell"

class HallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var hall = [Room]()
    var statusColor = [UIColor.red, UIColor.green, UIColor.yellow]
    
    //var ref: FIRDatabaseReference
    //{
      //  return FIRDatabase.database().reference()
    //}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        hall = [Room(roomNo: "room1", capacity: 2, status: 0, studentEmail: "email1", password: "email2"), Room(roomNo: "room2", capacity: 3, status: 1, studentEmail: "email2", password: "password2"), Room(roomNo: "room3", capacity: 1, status: 2, studentEmail: "email3", password: "password3")]
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        resizeScreen()
        collectionView.reloadData()
    }
    /*
    func grabLobbies()
    {
        hall.removeAll()
        ref.observeSingleEvent(of: .value, with:
            {   (snap) in
                if let dict = snap.value as? [String:Any] {
                    for lobbyName in dict.keys {
                        if let lobbyDict = dict[lobbyName] as? [String:Any] {
                            self.lobbies.append(Lobby(name: lobbyName, dict: lobbyDict))
                        }
                    }
                }
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
        })
    }
    */
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
        return hall.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! RoomCollectionViewCell
        
        cell.cellName.text = hall[indexPath.item].getRoomNo()
        cell.backgroundColor = statusColor[hall[indexPath.item].getStatus()]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
}
