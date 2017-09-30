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
    
    var refreshControl: UIRefreshControl!
    
    var ref: DatabaseReference
    {
        return Database.database().reference()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        hall = [Room(roomNo: "201", capacity: 2, comments: "", status: 1, studentEmail1:"jpark@hawk.iit.edu", password1: "league", studentEmail2: "dmarten@hawk.iit.edu",               password2:"agriculture"),
                Room(roomNo: "202", capacity: 2, comments: "", status: 2, studentEmail1:"wblodgett@hawk.iit.edu", password1: "durtle", studentEmail2: "khallsby@hawk.iit.edu", password2:"switzerland"),
                Room(roomNo: "203", capacity: 1, comments: "", status: 1, studentEmail1:"dwollin@hawk.iit.edu", password1: "respectingwomen", studentEmail2: "", password2: ""),]
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        resizeScreen()
        collectionView.reloadData()
        
        grabRooms()
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(grabRooms), for: UIControlEvents.valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    func writeComment(newComment:String) -> Void {
        self.ref.child("MSV").child("South").child("2nd Floor").child("201").child("Comments").setValue(newComment)
    }
    
    @objc func grabRooms()
    {
        hall.removeAll()
        ref.observeSingleEvent(of: .value, with:
            {   (snap) in
                if let dict = snap.value as? [String:Any] {
                    for room in dict.keys {
                        if let roomValues = dict[room] as? [String:Any] {
                            //print(roomValues["MSV"])
                            //self.hall.append(Room(roomNo: <#T##String#>, capacity: <#T##Int#>, status: <#T##Int#>, studentEmail: <#T##String#>, password: <#T##String#>))
                        }
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
        return hall.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! RoomCollectionViewCell
        
        cell.cellName.text = hall[indexPath.item].getRoomNo() + "\n" + hall[indexPath.item].getStudentEmail1() + "\n" + hall[indexPath.item].getPassword1()
        cell.backgroundColor = statusColor[hall[indexPath.item].getStatus()]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
}
