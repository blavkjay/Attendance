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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //CheckIn User
    @IBAction func checkInPressed(_ sender: Any) {
        
        existingDate()
    }
    
    // check existing dates
    
    func existingDate(){
        let calendar = NSCalendar.current
        let date = NSDate()
        let components = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        //  let hrs = " \(String(describing: components.hour))"
        // let mins=   "\(String(describing: components.minute))"
        let day =  " \(String(describing: components.day ?? 0))"
        let month =  " \(String(describing: components.month ?? 0))"
        let Year = " \(String(describing: components.year ?? 0))"
        let Today = day+":"+month+":"+Year
        
      //  let ref = FIRDatabase.database().reference()
        
        FIRDatabase
            .database().reference()
            .child("CheckIn")
            .queryOrdered(byChild: "Date")
            .queryEqual(toValue: "\(Today)")
            .observe(.childAdded, with: { (snapshot) in
                
                if(!snapshot.exists()){
                    self.saveTime()
                }else{
                    
                    Alert.showAlert(title: "Message", message: "Checked In Already for the day", vc: self)
                }
        })
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//            if (!snapshot.exists()) {
//                self.saveTime()
//            }
//            else {
//              Alert.showAlert(title: "Message", message: "Checked In Already for the day", vc: self)
//            }
//        })
        
    }
        

    // Save Time
    
    func saveTime(){
        
        let calendar = NSCalendar.current
        let date = NSDate()
        let components = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        //  let hrs = " \(String(describing: components.hour))"
        // let mins=   "\(String(describing: components.minute))"
        let day =  " \(String(describing: components.day ?? 0))"
        let month =  " \(String(describing: components.month ?? 0))"
        let Year = " \(String(describing: components.year ?? 0))"
        let Today = day+":"+month+":"+Year
        
        let isWeekEnd = Calendar.current.isDateInWeekend(date as Date)
        if isWeekEnd{
            
            Alert.showAlert(title: "Message", message: "No work today! Enjoy the Weekend", vc: self)
            
        }else{
        let checkInTime = FIRDatabase.database().reference().child("CheckInDate")
        let userDetails = ["Employee": FIRAuth.auth()?.currentUser?.email, "Date": Today]
        
        checkInTime.childByAutoId().setValue(userDetails){
            (error,reference) in
            
            if error != nil{
                print(error!)
            }else {
               Alert.showAlert(title: "Message", message: "Welcome Back to work! Checked In", vc: self)
            }
            
        }
        
        }
    }
    
    
}
    

