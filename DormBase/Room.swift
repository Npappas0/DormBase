//
//  Room.swift
//  DormBase
//
//  Created by Steven Wang on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit

class Room: NSObject {
    var roomNo: String
    var capacity: Int
    var status: Int
    var studentEmail: String
    var password: String
    
    init(roomNo: String, capacity: Int, status: Int, studentEmail: String, password: String){
        self.roomNo = roomNo
        self.capacity = capacity
        self.status = status
        self.studentEmail = studentEmail
        self.password = password
    }
}


