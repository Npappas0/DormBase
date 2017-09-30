//
//  Room.swift
//  DormBase
//
//  Created by Steven Wang on 9/30/17.
//  Copyright © 2017 Nick Pappas. All rights reserved.
//

import UIKit

class Room: NSObject { //Variables of Room class
    var roomNo: String
    var capacity: Int
    var status: Int
    var studentEmail1: String
    var password1: String
    var studentEmail2: String
    var password2: String
    var comments: String
    
    init(roomNo: String, capacity: Int, comments: String, status: Int, studentEmail1: String, password1: String, studentEmail2: String, password2: String){ //Constructor of Room class
        self.roomNo = roomNo
        self.capacity = capacity
        self.status = status
        self.studentEmail1 = studentEmail1
        self.password1 = password1
        self.studentEmail2 = studentEmail2
        self.password2 = password2
        self.comments = comments
    }
    
    // Setters of Room Class
    func setRoom(newRoomNo: String) -> Void {
        roomNo = newRoomNo
    }
    
    func setCapacity(newRoomCapacity: Int) -> Void {
        capacity = newRoomCapacity
    }
    
    func setStatus(newStatus: Int) -> Void {
        status = newStatus
    }
    
    func setStudentEmail1(newEmail1: String) -> Void {
        studentEmail1 = newEmail1
    }
    
    func setPassword1(newPassword1: String) -> Void {
        password1 = newPassword1
    }
    
    func setStudentEmail2(newEmail2: String) -> Void {
        studentEmail2 = newEmail2
    }
    
    func setPassword2(newPassword2: String) -> Void {
        password2 = newPassword2
    }
    
    func setComments(newComments: String) -> Void {
        comments = newComments
    }
   
    //Getters of Room Class
    func getRoomNo() -> String {
        return roomNo
    }
    
    func getCapacity() -> Int {
        return capacity
    }
    
    func getStatus() -> Int {
        return status
    }
    
    func getStudentEmail1() -> String {
        return studentEmail1
    }
    
    func getPassword1() -> String {
        return password1
    }
    
    func getStudentEmail2() -> String {
        return studentEmail2
    }
    
    func getPassword2() -> String {
        return password2
    }
    
    func getComments() -> String {
        return comments
    }
}


