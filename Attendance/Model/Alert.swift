//
//  Alert.swift
//  Attendance
//
//  Created by OLAJUWON on 10/9/18.
//  Copyright © 2018 OLAJUWON. All rights reserved.
//

import Foundation
import UIKit


class Alert {
    
    class func showAlert(title: String, message: String, vc: UIViewController)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}



