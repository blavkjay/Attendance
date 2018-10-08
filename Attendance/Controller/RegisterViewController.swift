//
//  RegisterViewController.swift
//  Attendance
//
//  Created by OLAJUWON on 10/8/18.
//  Copyright © 2018 OLAJUWON. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        
        
        SVProgressHUD.show()
        
        // Set up new user
        FIRAuth.auth()?.createUser(withEmail: EmailTextField.text!, password: PasswordTextField.text!, completion: { (user, error) in
            if error != nil{
                print(error!)
            }
            else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChecker", sender: self)
            }
        })
        
        
        
    }
    

}
