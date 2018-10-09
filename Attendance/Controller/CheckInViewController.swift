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
    // Save Time
    
    func saveTime(){
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        //  let hrs = " \(String(describing: components.hour))"
        // let mins=   "\(String(describing: components.minute))"
        let day =  " \(String(describing: components.day))"
        let month =  " \(String(describing: components.month))"
        let Year = " \(String(describing: components.year))"
        
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
