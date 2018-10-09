//
//  CheckInViewController.swift
//  Attendance
//
//  Created by OLAJUWON on 10/9/18.
//  Copyright © 2018 OLAJUWON. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CheckInViewController: UIViewController {
    
  
    
    enum CheckInError: Error{
        
        case Weekend
        case LoggedAlready
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //CheckIn User
    @IBAction func checkInPressed(_ sender: Any) {
        
        saveTime()
    }
    
    //Check for Errors
    
    func checkError() throws{
        
        
  
        
    }
    
    
    // check existing dates
    
//    func existingDate(){
//        let calendar = NSCalendar.current
//        let components = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
//        let day =  " \(String(describing: components.day ?? 0))"
//        let month =  " \(String(describing: components.month ?? 0))"
//        let Year = " \(String(describing: components.year ?? 0))"
//        let Today = day+":"+month+":"+Year
//        let ref = FIRDatabase.database().reference()
//        ref.child("CheckInDate").observeSingleEvent(of: .value, with: {
//            (snapshot) in
//
//        if snapshot.hasChild(Today){
//          print("Date exist already")
//        }else{
//            print("Date doesnt Exist ")
//        }
//    }
//    }
    
    
    
    // Save Time
    
    func saveTime(){
        
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        //  let hrs = " \(String(describing: components.hour))"
        // let mins=   "\(String(describing: components.minute))"
        let day =  " \(String(describing: components.day ?? 0))"
        let month =  " \(String(describing: components.month ?? 0))"
        let Year = " \(String(describing: components.year ?? 0))"
        let Today = day+":"+month+":"+Year
       
        let checkInTime = FIRDatabase.database().reference().child("CheckInDate")
        let userDetails = ["Employee": FIRAuth.auth()?.currentUser?.email, "Date": Today]
        
        checkInTime.childByAutoId().setValue(userDetails){
            (error,reference) in
            
            if error != nil{
                print(error!)
            }else {
                print("Checkin Saved ")
            }
            
        }
        
        
    }
    
    
    
    
}
