//
//  RecordsTableViewController.swift
//  Attendance
//
//  Created by OLAJUWON on 10/9/18.
//  Copyright © 2018 OLAJUWON. All rights reserved.
//

import UIKit
import Firebase 

class RecordsTableViewController: UITableViewController {

    var RecordsArray : [Records] = [Records]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveDate()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"recordsDetails", for: indexPath)
       let RecordCell = RecordsArray[indexPath.row]
        cell.textLabel!.text = RecordCell.date
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecordsArray.count
    }
    
    func retrieveDate(){
        
        let DateDB = FIRDatabase.database().reference().child("CheckInDate")
        DateDB.observe(.childAdded) { (snapshot) in
            if let snapshotvalue = snapshot.value as?  NSDictionary{
          
                let date = snapshotvalue["Date"] as! String
            
            let Details = Records()
            Details.date = date
            self.RecordsArray.append(Details)
           self.tableView.reloadData()
            }
        }
   
    }
    
//    @IBAction func logOutPressed(_ sender: Any) {
//    
//        do{
//            
//            try FIRAuth.auth()?.signOut()
//            navigationController?.popToRootViewController(animated: true)
//        }catch{
//           print("Error occured while logging out")
//        }
//    
//    }
    
}
