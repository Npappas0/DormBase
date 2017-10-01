//
//  DetailViewController.swift
//  DormBase
//
//  Created by Nick Pappas on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var comments: UILabel!
   
    var room = Room(roomNo: "", dict: dictionaryWithValues(forKeys: [""]))
    var statusColor = [UIColor.gray, UIColor.green, UIColor.yellow, UIColor.red]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textView.text = "Room Number: \(room.getRoomNo())\n Capacity: \(room.getCapacity())\n Student One Email: \(room.getStudentEmail1())\n Student Two Email: \(room.getStudentEmail2())"
        comments.text = room.getComments()
        statusView.backgroundColor = statusColor[room.getStatus()]
    }
    
}
