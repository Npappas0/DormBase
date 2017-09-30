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
    var studentEmail: String
    var password: String
    
    init(roomNo: String, capacity: Int, status: Int, studentEmail: String, password: String){ //Constructor of Room class
        self.roomNo = roomNo
        self.capacity = capacity
        self.status = status
        self.studentEmail = studentEmail
        self.password = password
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
    
    func setStudentEmail(newEmail: String) -> Void {
        studentEmail = newEmail
    }
    
    func setPassword(newPassword: String) -> Void {
        password = newPassword
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
    
    func getStudentEmail() -> String {
        return studentEmail
    }
    
    func getPassword() -> String {
        return password
    }
}


